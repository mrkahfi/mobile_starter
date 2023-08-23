// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zot_starter/src/features/products/domain/product.dart';

part 'cart_item_response.g.dart';
part 'cart_item_response.freezed.dart';

/// A product along with a quantity that can be added to an order/cart
@freezed
class CartItemResponse with _$CartItemResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CartItemResponse({
    required ProductID productId,
    required int quantity,
  }) = _CartItemResponse;

  factory CartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemResponseFromJson(json);
}
