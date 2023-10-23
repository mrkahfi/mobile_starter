import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/repositories/local_cart_repository.dart';
import 'package:zot_starter/src/common/data/repositories/remote_cart_repository.dart';
import 'package:zot_starter/src/common/data/sources/sources.dart';
import 'package:zot_starter/src/common/services/auth_service.dart';
import 'package:zot_starter/src/features/cart/domain/cart.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';
import 'package:zot_starter/src/features/cart/domain/mutable_cart.dart';
import 'package:zot_starter/src/features/products/data/products_repository.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;

  /// fetch the cart from the local or remote repository
  /// depending on the user auth state
  Future<Result<Cart>> _fetchCart() async {
    final user = await ref.read(authServiceProvider).currentUser;
    if (user != null) {
      return ref.read(remoteCartRepositoryProvider).fetchCart(user.uid);
    } else {
      return ref.read(localCartRepositoryProvider).fetchCart();
    }
  }

  /// save the cart to the local or remote repository
  /// depending on the user auth state
  Future<void> _setCart(Cart cart) async {
    final user = await ref.read(authServiceProvider).currentUser;
    if (user != null) {
      await ref.read(remoteCartRepositoryProvider).setCart(user.uid, cart);
    } else {
      ref.read(localCartRepositoryProvider).cart = cart;
    }
  }

  /// sets an item in the local or remote cart depending on the user auth state
  Future<void> setItem(CartItem item) async {
    final result = await _fetchCart();
    result.when(
      success: (cart) {
        final updated = cart.setItem(item);
        _setCart(updated);
      },
      failure: (error, stackTrace) {},
    );
  }

  /// adds an item in the local or remote cart depending on the user auth state
  Future<void> addItem(CartItem item) async {
    final result = await _fetchCart();
    result.when(
      success: (data) {
        final updated = data.addItem(item);

        _setCart(updated);
      },
      failure: (error, stackTrace) {},
    );
  }

  /// removes an item from the local or remote cart depending on the user auth
  /// state
  Future<void> removeItemById(ProductID productId) async {
    final result = await _fetchCart();

    result.when(
      success: (cart) {
        final updated = cart.removeItemById(productId);
        _setCart(updated);
      },
      failure: (error, stackTrace) {},
    );
  }
}

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(ref);
});

final cartProvider = StreamProvider<Cart>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user != null) {
    return ref.watch(remoteCartRepositoryProvider).watchCart(user.uid);
  } else {
    return ref.watch(localCartRepositoryProvider).watchCart();
  }
});

// Items count regardless the quantity
final cartItemsCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.items.length,
        orElse: () => 0,
      );
});

// Total price
final cartTotalProvider = Provider.autoDispose<double>((ref) {
  final cart = ref.watch(cartProvider).value ?? Cart(items: []);
  final productsList = ref.watch(productsListFutureProvider).value ?? [];
  if (cart.items.isNotEmpty && productsList.isNotEmpty) {
    var total = 0.0;
    for (final item in cart.items) {
      final product =
          productsList.firstWhere((product) => product.id == item.productId);
      total += product.price * item.quantity;
    }
    return total;
  } else {
    return 0.0;
  }
});

final cartItemQuantityProvider =
    Provider.autoDispose.family<int, Product>((ref, product) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    // get the current quantity for the given product in the cart
    final item = cart.items
        .firstWhereOrNull((element) => element.productId == product.id);
    return item != null ? item.quantity : 0;
  } else {
    return 0;
  }
});

final itemAvailableQuantityProvider =
    Provider.autoDispose.family<int, Product>((ref, product) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    // get the current quantity for the given product in the cart
    final item = cart.items
        .firstWhereOrNull((element) => element.productId == product.id);
    final quantity = item != null ? item.quantity : 0;
    // subtract it from the product available quantity
    return max(0, product.availableQuantity - quantity);
  } else {
    return product.availableQuantity;
  }
});
