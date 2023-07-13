// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlantState {
  AsyncValue<PlantItem?> get plantItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlantStateCopyWith<PlantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantStateCopyWith<$Res> {
  factory $PlantStateCopyWith(PlantState value, $Res Function(PlantState) then) =
      _$PlantStateCopyWithImpl<$Res, PlantState>;
  @useResult
  $Res call({AsyncValue<PlantItem?> plantItem});
}

/// @nodoc
class _$PlantStateCopyWithImpl<$Res, $Val extends PlantState>
    implements $PlantStateCopyWith<$Res> {
  _$PlantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantItem = null,
  }) {
    return _then(_value.copyWith(
      plantItem: null == plantItem
          ? _value.plantItem
          : plantItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<PlantItem?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlantStateCopyWith<$Res> implements $PlantStateCopyWith<$Res> {
  factory _$$_PlantStateCopyWith(
          _$_PlantState value, $Res Function(_$_PlantState) then) =
      __$$_PlantStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<PlantItem?> plantItem});
}

/// @nodoc
class __$$_PlantStateCopyWithImpl<$Res>
    extends _$PlantStateCopyWithImpl<$Res, _$_PlantState>
    implements _$$_PlantStateCopyWith<$Res> {
  __$$_PlantStateCopyWithImpl(
      _$_PlantState _value, $Res Function(_$_PlantState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantItem = null,
  }) {
    return _then(_$_PlantState(
      plantItem: null == plantItem
          ? _value.plantItem
          : plantItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<PlantItem?>,
    ));
  }
}

/// @nodoc

class _$_PlantState implements _PlantState {
  const _$_PlantState({this.plantItem = const AsyncValue.data(null)});

  @override
  @JsonKey()
  final AsyncValue<PlantItem?> plantItem;

  @override
  String toString() {
    return 'PlantState(plantItem: $plantItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlantState &&
            (identical(other.plantItem, plantItem) || other.plantItem == plantItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plantItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlantStateCopyWith<_$_PlantState> get copyWith =>
      __$$_PlantStateCopyWithImpl<_$_PlantState>(this, _$identity);
}

abstract class _PlantState implements PlantState {
  const factory _PlantState({final AsyncValue<PlantItem?> plantItem}) = _$_PlantState;

  @override
  AsyncValue<PlantItem?> get plantItem;
  @override
  @JsonKey(ignore: true)
  _$$_PlantStateCopyWith<_$_PlantState> get copyWith =>
      throw _privateConstructorUsedError;
}
