import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/mappers/cart_mapper.dart';
import 'package:zot_starter/src/common/data/sources/remote/api/cart_api.dart';
import 'package:zot_starter/src/common/data/sources/sources.dart';
import 'package:zot_starter/src/features/cart/domain/cart.dart';

/// API for reading, watching and writing cart data for a specific user ID
class RemoteCartRepository {
  RemoteCartRepository(this._cartApi);

  final CartApi _cartApi;

  Future<Result<Cart>> fetchCart(String uid) async {
    try {
      final response = await _cartApi.fetchCart();

      final cart = CartMapper.mapCartResponseListRespoToCart(response);

      return Result.success(cart);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }

  Stream<Cart> watchCart(String uid) async* {
    final response = await _cartApi.fetchCart();

    final cart = CartMapper.mapCartResponseListRespoToCart(response);

    yield cart;
  }

  Future<Result<Cart>> setCart(String uid, Cart cart) async {
    try {
      final response = await _cartApi.setCart();

      final cart = CartMapper.mapCartResponseListRespoToCart(response);

      return Result.success(cart);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }
}

final remoteCartRepositoryProvider = Provider<RemoteCartRepository>(
  (ref) => RemoteCartRepository(ref.watch(cartApiProvider)),
);
