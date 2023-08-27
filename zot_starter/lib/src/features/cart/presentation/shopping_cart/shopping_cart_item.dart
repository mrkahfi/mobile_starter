import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/common/components//async_value_widget.dart';
import 'package:zot_starter/src/common/components/item_quantity_selector.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';
import 'package:zot_starter/src/features/cart/presentation/shopping_cart/shopping_cart_screen_controller.dart';
import 'package:zot_starter/src/features/products/data/products_repository.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';
import 'package:zot_starter/src/utils/currency_formatter.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

/// Shows a shopping cart item (or loading/error UI if needed)
class ShoppingCartItem extends ConsumerWidget {
  const ShoppingCartItem({
    required this.item,
    required this.itemIndex,
    super.key,
    this.isEditable = true,
  });
  final CartItem item;
  final int itemIndex;

  /// if true, an [ItemQuantitySelector] and a delete button will be shown
  /// if false, the quantity will be shown as a read-only label (used in the
  /// [PaymentPage])
  final bool isEditable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productProvider(item.productId));
    return AsyncValueWidget<Product?>(
      value: productValue,
      data: (product) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ShoppingCartItemContents(
              product: product!,
              item: item,
              itemIndex: itemIndex,
              isEditable: isEditable,
            ),
          ),
        ),
      ),
    );
  }
}

/// Shows a shopping cart item for a given product
class ShoppingCartItemContents extends ConsumerWidget {
  const ShoppingCartItemContents({
    required this.product,
    required this.item,
    required this.itemIndex,
    required this.isEditable,
    super.key,
  });
  final Product product;
  final CartItem item;
  final int itemIndex;
  final bool isEditable;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted =
        ref.watch(currencyFormatterProvider).format(product.price);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
        Gap.h24,
        Text(priceFormatted, style: Theme.of(context).textTheme.headlineSmall),
        Gap.h24,
        if (isEditable) ...[
          EditOrRemoveItemWidget(
            product: product,
            item: item,
            itemIndex: itemIndex,
          )
        ] else ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Quantity: ${item.quantity}'.hardcoded,
            ),
          )
        ],
      ],
    );
  }
}

// custom widget to show the quantity selector and a delete button
class EditOrRemoveItemWidget extends ConsumerWidget {
  const EditOrRemoveItemWidget({
    required this.product,
    required this.item,
    required this.itemIndex,
    super.key,
  });
  final Product product;
  final CartItem item;
  final int itemIndex;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemQuantitySelector(
          quantity: item.quantity,
          maxQuantity: min(product.availableQuantity, 10),
          itemIndex: itemIndex,
          onChanged: state.isLoading
              ? null
              : (quantity) => ref
                  .read(shoppingCartScreenControllerProvider.notifier)
                  .updateItemQuantity(item.productId, quantity),
        ),
        IconButton(
          key: deleteKey(itemIndex),
          icon: Icon(Icons.delete, color: Colors.red[700]),
          onPressed: state.isLoading
              ? null
              : () => ref
                  .read(shoppingCartScreenControllerProvider.notifier)
                  .removeItemById(item.productId),
        ),
        const Spacer(),
      ],
    );
  }
}
