import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zot_starter/src/common/domain/entities/item.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncValue.data(<Item>[])) AsyncValue<List<Item>> value,
  }) = _HomeState;
}
