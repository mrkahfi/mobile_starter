
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'location_item.freezed.dart';
part 'location_item.g.dart';

/// Entity description
/// TODO(yourgitusername): Add [LocationItemAdapter] to [HiveDB.init()]
@freezed
@HiveType(typeId: 1) // TODO(yourgitusername): Change `typeId`
class LocationItem with _$LocationItem {
  const factory LocationItem({
    // TODO(yourgitusername): Change the field id
    @HiveField(0) String? id,
  }) = _LocationItem;

}
