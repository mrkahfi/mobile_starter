import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/common/components/async_value_widget.dart';
import 'package:zot_starter/src/features/cart/presentation/add_to_cart/add_to_cart_widget.dart';
import 'package:zot_starter/src/features/cart/presentation/shopping_cart/empty_placeholder_widget.dart';
import 'package:zot_starter/src/features/products/data/products_repository.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';
import 'package:zot_starter/src/utils/currency_formatter.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

/// Shows the product page for a given product ID.
class ProductScreen extends StatelessWidget {
  const ProductScreen({
    required this.productId,
    super.key,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, _) {
          final productValue = ref.watch(productProvider(productId));
          return AsyncValueWidget<Product?>(
            value: productValue,
            data: (product) => product == null
                ? EmptyPlaceholderWidget(
                    message: 'Product not found'.hardcoded,
                  )
                : ProductDetails(product: product),
          );
        },
      ),
    );
  }
}

/// Shows all the product details along with actions to:
/// - leave a review
/// - add to cart
class ProductDetails extends ConsumerWidget {
  const ProductDetails({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted =
        ref.watch(currencyFormatterProvider).format(product.price);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(product.title, style: Theme.of(context).textTheme.titleLarge),
            Gap.h8,
            Text(product.description),
            Gap.h8,
            const Divider(),
            Text(
              priceFormatted,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            AddToCartWidget(product: product),
          ],
        ),
      ),
    );
  }
}
