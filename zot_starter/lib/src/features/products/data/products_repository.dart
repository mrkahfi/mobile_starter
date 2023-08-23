import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/mappers/product_mapper.dart';
import 'package:zot_starter/src/common/data/sources/remote/api/product_api.dart';
import 'package:zot_starter/src/common/data/sources/sources.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';
import 'package:zot_starter/src/utils/delay.dart';

class ProductsRepository {
  ProductsRepository(this.productApi);
  final ProductApi productApi;

  Future<Result<Product>> getProduct(String id) async {
    try {
      final response = await productApi.getProduct(id);

      final product = ProductMapper.mapItemRespondToProduct(response);

      return Result.success(product);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }

  Future<List<Product>> fetchProductsList() async {
    try {
      final response = await productApi.getProducts();

      final productList =
          ProductMapper.mapItemListRespondToProductList(response!.items);

      return productList;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Product>> watchProductsList() async* {
    await delay();
    yield await fetchProductsList();
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList().map((products) => _getProduct(products, id));
  }

  static Product? _getProduct(List<Product> products, String id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  // * Set addDelay to false for faster loading
  return ProductsRepository(ref.watch(productApiApiProvider));
});

final productsListFutureProvider =
    FutureProvider.autoDispose<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsList();
});

final productProvider =
    StreamProvider.autoDispose.family<Product?, String>((ref, id) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProduct(id);
});
