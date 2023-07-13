import 'package:demo_app/src/features/ikan/domain/entities/kakap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ikan_state.freezed.dart';

@freezed
class IkanState with _$IkanState {
  const factory IkanState({
    @Default(AsyncValue.data(null)) AsyncValue<Kakap?> kakap,
  }) = _IkanState;
}
