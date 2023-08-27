import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:zot_starter/src/features/cart/domain/cart_item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

/// Model class representing the shopping cart contents.
/// Object that the UI needs.
@freezed
class Cart with _$Cart {
  @HiveType(typeId: 3, adapterName: 'CartAdapter')
  factory Cart({@Default([]) List<CartItem> items}) = _Cart;
}
