import 'package:demo_app/src/commons/data/sources/local/hive_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'plant_item.freezed.dart';
part 'plant_item.g.dart';

/// Entity description
/// //TODO(mrkahfi): Add [PlantItemAdapter] to [HiveDB].init() //TODO:
@freezed
@HiveType(typeId: 1) // TODO(yourgitusername): Change `typeId`
class PlantItem with _$PlantItem {
  const factory PlantItem({
    // TODO(yourgitusername): Change the field id
    @HiveField(0) String? id,
  }) = _PlantItem;
}
