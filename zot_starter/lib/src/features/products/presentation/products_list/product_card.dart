import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';
import 'package:zot_starter/src/utils/currency_formatter.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

/// Used to show a single product inside a card.
class ProductCard extends ConsumerWidget {
  const ProductCard({required this.product, super.key, this.onPressed});
  final Product product;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted =
        ref.watch(currencyFormatterProvider).format(product.price);
    return Card(
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(AppSizes.h16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(imageUrl: product.imageUrl),
              Gap.h8,
              const Divider(),
              Gap.h8,
              Text(
                product.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gap.h24,
              Text(
                priceFormatted,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Gap.h4,
              Text(
                product.availableQuantity <= 0
                    ? 'Out of Stock'.hardcoded
                    : 'Quantity: ${product.availableQuantity}'.hardcoded,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
