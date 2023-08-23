import 'package:zot_starter/src/features/products/domain/product.dart';

/// A product along with a quantity that can be added to an order/cart
class CartItem {
  CartItem({
    required this.productId,
    required this.quantity,
  });
  final ProductID productId;
  int quantity;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem &&
        other.productId == productId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => productId.hashCode ^ quantity.hashCode;
}
