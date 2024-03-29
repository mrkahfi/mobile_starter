import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/features/cart/application/cart_service.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';

class AddToCartController extends StateNotifier<AsyncValue<int>> {
  AddToCartController({required this.cartService}) : super(const AsyncData(1));
  final CartService cartService;

  void updateQuantity(int quantity) {
    state = AsyncData(quantity);
  }

  Future<void> addItem(ProductID productId) async {
    final item = CartItem(productId: productId, quantity: state.value!);
    state = const AsyncLoading<int>().copyWithPrevious(state);
    final value = await AsyncValue.guard(() => cartService.addItem(item));
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = const AsyncData(1);
    }
  }
}

final addToCartControllerProvider =
    StateNotifierProvider.autoDispose<AddToCartController, AsyncValue<int>>(
        (ref) {
  return AddToCartController(
    cartService: ref.watch(cartServiceProvider),
  );
});
