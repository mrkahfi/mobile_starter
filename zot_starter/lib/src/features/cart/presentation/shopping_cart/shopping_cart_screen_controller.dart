import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/features/cart/application/cart_service.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';

class ShoppingCartScreenController extends StateNotifier<AsyncValue<void>> {
  ShoppingCartScreenController({required this.cartService})
      : super(const AsyncData(null));
  final CartService cartService;

  Future<void> updateItemQuantity(ProductID productId, int quantity) async {
    state = const AsyncLoading();
    final updated = CartItem(productId: productId, quantity: quantity);
    state = await AsyncValue.guard(() => cartService.setItem(updated));
  }

  Future<void> removeItemById(ProductID productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.removeItemById(productId));
  }
}

final shoppingCartScreenControllerProvider =
    StateNotifierProvider<ShoppingCartScreenController, AsyncValue<void>>(
        (ref) {
  return ShoppingCartScreenController(
    cartService: ref.watch(cartServiceProvider),
  );
});
