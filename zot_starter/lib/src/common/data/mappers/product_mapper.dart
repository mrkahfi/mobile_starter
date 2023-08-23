import 'package:zot_starter/src/common/data/models/responses/item_response.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class ProductMapper {
  const ProductMapper._();

  static List<Product> mapItemListRespondToProductList(
    List<ItemResponse> data,
  ) {
    return data
        .map(
          (e) => Product(
            id: '${e.id}',
            title: e.title ?? 'No title',
            description: e.description ?? 'No description',
            imageUrl: e.thumbnail ?? '',
            price: (e.price ?? 0).toDouble(),
            availableQuantity: e.stock ?? 0,
          ),
        )
        .toList();
  }

  static Product mapItemRespondToProduct(
    ItemResponse data,
  ) {
    return Product(
      id: '${data.id}',
      title: data.title ?? 'No title',
      description: data.description ?? 'No description',
      imageUrl: data.thumbnail ?? '',
      price: (data.price ?? 0).toDouble(),
      availableQuantity: data.stock ?? 0,
    );
  }
}
