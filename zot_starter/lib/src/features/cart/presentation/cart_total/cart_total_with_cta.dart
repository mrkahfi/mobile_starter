import 'package:flutter/material.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/features/cart/presentation/cart_total/cart_total_text.dart';

/// Widget for showing the shopping cart total with a checkout button
class CartTotalWithCTA extends StatelessWidget {
  const CartTotalWithCTA({required this.ctaBuilder, super.key});
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CartTotalText(),
        Gap.h8,
        ctaBuilder(context),
        Gap.h8,
      ],
    );
  }
}
