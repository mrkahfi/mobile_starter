import 'package:demo_app/src/features/plant/domain/entities/plant_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_state.freezed.dart';

@freezed
class PlantState with _$PlantState {
  const factory PlantState({
    @Default(AsyncValue.data(null)) AsyncValue<PlantItem?> plantItem,
  }) = _PlantState;
}
