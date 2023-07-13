import 'package:demo_app/src/features/user_location/domain/entities/location_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location_state.freezed.dart';

@freezed
class UserLocationState with _$UserLocationState {
  const factory UserLocationState({
    @Default(AsyncValue.data(null)) AsyncValue<LocationItem?> locationItem,
  }) = _UserLocationState;
}
