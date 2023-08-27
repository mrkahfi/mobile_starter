import 'package:zot_starter/src/features/cart/domain/cart.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';

/// Helper extension used to mutate the items in the shopping cart.
extension MutableCart on Cart {
  /// add an item to the cart by *overriding* the quantity if it already exists
  Cart setItem(CartItem item) {
    final copy = List<CartItem>.from(items);
    copy
        .firstWhere(
          (element) => element.productId == item.productId,
        )
        .quantity = item.quantity;
    // copy.firstWhere((element) => element.) = item.quantity;
    return Cart(items: copy);
  }

  /// add an item to the cart by *updating* the quantity if it already exists
  Cart addItem(CartItem item) {
    final copy = List<CartItem>.from(items);
    final existingItemIndex =
        copy.indexWhere((element) => element.productId == item.productId);
    final itemAlreadyExists = existingItemIndex > 0;
    if (itemAlreadyExists) {
      copy[existingItemIndex] = item;
    } else {
      copy.add(item);
    }

    return Cart(items: copy);
  }

  /// add a list of items to the cart by *updating* the quantities of items that
  /// already exist
  Cart addItems(List<CartItem> itemsToAdd) {
    final copy = List<CartItem>.from(items);

    for (final item in itemsToAdd) {
      final existingItemIndex =
          copy.indexWhere((element) => element.productId == item.productId);
      final itemAlreadyExists = existingItemIndex > 0;
      if (itemAlreadyExists) {
        copy[existingItemIndex] = item;
      } else {
        copy.add(item);
      }
    }

    return Cart(items: copy);
  }

  /// if an item with the given productId is found, remove it
  Cart removeItemById(ProductID productId) {
    final copy = List<CartItem>.from(items)..remove(productId);
    return Cart(items: copy);
  }
}
