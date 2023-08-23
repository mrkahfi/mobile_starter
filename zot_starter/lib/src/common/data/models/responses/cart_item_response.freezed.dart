// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartItemResponse _$CartItemResponseFromJson(Map<String, dynamic> json) {
  return _CartItemResponse.fromJson(json);
}

/// @nodoc
mixin _$CartItemResponse {
  String get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemResponseCopyWith<CartItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemResponseCopyWith<$Res> {
  factory $CartItemResponseCopyWith(
          CartItemResponse value, $Res Function(CartItemResponse) then) =
      _$CartItemResponseCopyWithImpl<$Res, CartItemResponse>;
  @useResult
  $Res call({String productId, int quantity});
}

/// @nodoc
class _$CartItemResponseCopyWithImpl<$Res, $Val extends CartItemResponse>
    implements $CartItemResponseCopyWith<$Res> {
  _$CartItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartItemResponseCopyWith<$Res>
    implements $CartItemResponseCopyWith<$Res> {
  factory _$$_CartItemResponseCopyWith(
          _$_CartItemResponse value, $Res Function(_$_CartItemResponse) then) =
      __$$_CartItemResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, int quantity});
}

/// @nodoc
class __$$_CartItemResponseCopyWithImpl<$Res>
    extends _$CartItemResponseCopyWithImpl<$Res, _$_CartItemResponse>
    implements _$$_CartItemResponseCopyWith<$Res> {
  __$$_CartItemResponseCopyWithImpl(
      _$_CartItemResponse _value, $Res Function(_$_CartItemResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_$_CartItemResponse(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CartItemResponse implements _CartItemResponse {
  _$_CartItemResponse({required this.productId, required this.quantity});

  factory _$_CartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemResponseFromJson(json);

  @override
  final String productId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartItemResponse(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemResponse &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemResponseCopyWith<_$_CartItemResponse> get copyWith =>
      __$$_CartItemResponseCopyWithImpl<_$_CartItemResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartItemResponseToJson(
      this,
    );
  }
}

abstract class _CartItemResponse implements CartItemResponse {
  factory _CartItemResponse(
      {required final String productId,
      required final int quantity}) = _$_CartItemResponse;

  factory _CartItemResponse.fromJson(Map<String, dynamic> json) =
      _$_CartItemResponse.fromJson;

  @override
  String get productId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemResponseCopyWith<_$_CartItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
