// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zot_starter/src/common/data/models/responses/cart_item_response.dart';

part 'cart_response.g.dart';
part 'cart_response.freezed.dart';

/// Model class representing the shopping cart contents.
@freezed
class CartResponse with _$CartResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CartResponse({@Default([]) List<CartItemResponse>? items}) =
      _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
