import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/sources/sources.dart';
import 'package:zot_starter/src/features/cart/domain/cart.dart';

/// API for reading, watching and writing local cart data (guest user)
class LocalCartRepository {
  LocalCartRepository(this.hiveService);

  final HiveService hiveService;

  Result<Cart> fetchCart() => Result.success(hiveService.cart);

  Stream<Cart> watchCart() => hiveService.cartBox
      .watch(key: hiveService.cart)
      .map((event) => event.value as Cart);

  set cart(Cart cart) => hiveService.cart = cart;

  Cart get cart => hiveService.cart;
}

final localCartRepositoryProvider = Provider<LocalCartRepository>(
  (ref) => LocalCartRepository(ref.watch(hiveServiceProvider)),
);
