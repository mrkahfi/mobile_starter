import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/components//async_value_widget.dart';
import 'package:zot_starter/src/common/components/button.dart';
import 'package:zot_starter/src/features/cart/application/cart_service.dart';
import 'package:zot_starter/src/features/cart/domain/cart.dart';
import 'package:zot_starter/src/features/cart/presentation/shopping_cart/shopping_cart_item.dart';
import 'package:zot_starter/src/features/cart/presentation/shopping_cart/shopping_cart_items_builder.dart';
import 'package:zot_starter/src/features/cart/presentation/shopping_cart/shopping_cart_screen_controller.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

/// Shopping cart screen showing the items in the cart (with editable
/// quantities) and a button to checkout.
class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      shoppingCartScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'.hardcoded),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartValue = ref.watch(cartProvider);
          return AsyncValueWidget<Cart>(
            value: cartValue,
            data: (cart) => ShoppingCartItemsBuilder(
              items: cart.items,
              itemBuilder: (_, item, index) => ShoppingCartItem(
                item: item,
                itemIndex: index,
              ),
              ctaBuilder: (_) => CommonButton(
                'Checkout'.hardcoded,
                isLoading: state.isLoading,
                onPressed: () => context.pushNamed(''),
              ),
            ),
          );
        },
      ),
    );
  }
}
