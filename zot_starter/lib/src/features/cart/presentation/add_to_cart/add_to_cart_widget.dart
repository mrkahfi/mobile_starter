import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/common/components//item_quantity_selector.dart';
import 'package:zot_starter/src/common/components/button.dart';
import 'package:zot_starter/src/features/cart/application/cart_service.dart';
import 'package:zot_starter/src/features/cart/presentation/add_to_cart/add_to_cart_controller.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';
import 'package:zot_starter/src/utils/extensions/async_value.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

/// A widget that shows an [ItemQuantitySelector] along with a [CommonButton]
/// to add the selected quantity of the item to the cart.
class AddToCartWidget extends ConsumerWidget {
  const AddToCartWidget({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<int>>(
      addToCartControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final availableQuantity = ref.watch(itemAvailableQuantityProvider(product));
    final cartItemsCount = ref.watch(cartItemQuantityProvider(product));
    final state = ref.watch(addToCartControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quantity:'.hardcoded),
            ItemQuantitySelector(
              quantity: state.value!,
              // let the user choose up to the available quantity or
              // 10 items at most
              maxQuantity: min(availableQuantity, 10),
              onChanged: state.isLoading
                  ? null
                  : (quantity) => ref
                      .read(addToCartControllerProvider.notifier)
                      .updateQuantity(quantity),
            ),
          ],
        ),
        Gap.h8,
        const Divider(),
        Gap.h8,
        CommonButton(
          availableQuantity > 0
              ? 'Add to Cart'.hardcoded
              : 'Out of Stock'.hardcoded,
          isDisabled: availableQuantity <= 0,
          isLoading: state.isLoading,
          // only enable the button if there is enough stock
          onPressed: () => ref
              .read(addToCartControllerProvider.notifier)
              .addItem(product.id),
        ),
        if (cartItemsCount > 0) ...[
          Gap.h8,
          Text(
            'Already added to cart'.hardcoded,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ]
      ],
    );
  }
}
