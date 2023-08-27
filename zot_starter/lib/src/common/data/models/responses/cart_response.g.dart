// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartResponse _$$_CartResponseFromJson(Map<String, dynamic> json) =>
    _$_CartResponse(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CartResponseToJson(_$_CartResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
