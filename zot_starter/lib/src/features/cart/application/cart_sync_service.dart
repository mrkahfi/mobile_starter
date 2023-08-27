import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/repositories/local_cart_repository.dart';
import 'package:zot_starter/src/common/data/repositories/remote_cart_repository.dart';
import 'package:zot_starter/src/common/services/auth_service.dart';
import 'package:zot_starter/src/features/cart/domain/cart.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';
import 'package:zot_starter/src/features/cart/domain/mutable_cart.dart';
import 'package:zot_starter/src/features/products/data/products_repository.dart';

class CartSyncService {
  CartSyncService(this.ref) {
    _init();
  }
  final Ref ref;

  void _init() {
    ref.watch(authServiceProvider).addListener(() async {
      final user = await ref.watch(authServiceProvider).currentUser;
      if (user != null) {
        await _moveItemsToRemoteCart(user.uid);
      }
    });
  }

  /// moves all items from the local to the remote cart taking into account the
  /// available quantities
  Future<void> _moveItemsToRemoteCart(String uid) async {
    try {
      // Get the local cart data
      final localCartRepository = ref.read(localCartRepositoryProvider);
      final localCart = localCartRepository.cart;
      if (localCart.items.isNotEmpty) {
        // Get the remote cart data
        final remoteCartRepository = ref.read(remoteCartRepositoryProvider);
        final result = await remoteCartRepository.fetchCart(uid);

        await result.when(
          success: (remoteCart) async {
            final localItemsToAdd =
                await _getLocalItemsToAdd(localCart, remoteCart);
            // Add all the local items to the remote cart
            final updatedRemoteCart = remoteCart.addItems(localItemsToAdd);
            // Write the updated remote cart data to the repository
            await remoteCartRepository.setCart(uid, updatedRemoteCart);
          },
          failure: (error, stackTrace) {},
        );
        // Remove all items from the local cart
        localCartRepository.cart = Cart(items: []);
      }
    } catch (e) {
      // TODO: Handle error and/or rethrow
    }
  }

  Future<List<CartItem>> _getLocalItemsToAdd(
    Cart localCart,
    Cart remoteCart,
  ) async {
    // Get the list of products (needed to read the available quantities)
    final productsRepository = ref.read(productsRepositoryProvider);
    final products = await productsRepository.fetchProductsList();

    // Figure out which items need to be added
    final localItemsToAdd = <CartItem>[];
    for (final localItem in localCart.items) {
      final productId = localItem.productId;
      final localQuantity = localItem.quantity;
      // get the quantity for the corresponding item in the remote cart
      final remoteQuantity = remoteCart.items
          .firstWhere((element) => element.productId == productId)
          .quantity;
      final product = products.firstWhere((product) => product.id == productId);
      // Cap the quantity of each item to the available quantity
      final cappedLocalQuantity = min(
        localQuantity,
        product.availableQuantity - remoteQuantity,
      );
      // if the capped quantity is > 0, add to the list of items to add
      if (cappedLocalQuantity > 0) {
        localItemsToAdd
            .add(CartItem(productId: productId, quantity: cappedLocalQuantity));
      }
    }

    return localItemsToAdd;
  }
}

final cartSyncServiceProvider = Provider<CartSyncService>((ref) {
  return CartSyncService(ref);
});
