import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/components/async_value_widget.dart';
import 'package:zot_starter/src/features/products/data/products_repository.dart';
import 'package:zot_starter/src/features/products/presentation/products_list/product_card.dart';
import 'package:zot_starter/src/features/products/presentation/products_list/product_screen.dart';
import 'package:zot_starter/src/utils/extensions/widget_extension.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsListFutureProvider);
    return AsyncValueWidget(
      value: products,
      data: (items) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final product = products.value?[index];
            return ProductCard(
              product: product!,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => ProductScreen(productId: product.id),
                ),
              ),
            );
          },
          itemCount: products.value?.length,
        ).withDefaultPadding;
      },
    );
  }
}
