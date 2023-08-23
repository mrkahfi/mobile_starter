import 'package:flutter/material.dart';
import 'package:zot_starter/src/features/cart/domain/cart_item.dart';
import 'package:zot_starter/src/features/cart/presentation/cart_total/cart_total_with_cta.dart';
import 'package:zot_starter/src/features/cart/presentation/shopping_cart/empty_placeholder_widget.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

/// Responsive widget showing the cart items and the checkout button
class ShoppingCartItemsBuilder extends StatelessWidget {
  const ShoppingCartItemsBuilder({
    required this.items,
    required this.itemBuilder,
    required this.ctaBuilder,
    super.key,
  });
  final List<CartItem> items;
  final Widget Function(BuildContext, CartItem, int) itemBuilder;
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    // If there are no items, show a placeholder
    if (items.isEmpty) {
      return EmptyPlaceholderWidget(
          message: 'Your shopping cart is empty'.hardcoded,);
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final item = items[index];
              return itemBuilder(context, item, index);
            },
            itemCount: items.length,
          ),
        ),
        CartTotalWithCTA(ctaBuilder: ctaBuilder),
      ],
    );
  }
}
