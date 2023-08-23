import 'package:zot_starter/src/common/data/models/responses/cart_response.dart';
import 'package:zot_starter/src/features/cart/domain/cart.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class CartMapper {
  const CartMapper._();

  static Cart mapCartResponseListRespoToCart(CartResponse data) {
    return Cart(
      items: data.items != null
          ? data.items!
              .map(
                (e) => CartItem(productId: e.productId, quantity: e.quantity),
              )
              .toList()
          : [],
    );
  }
}
