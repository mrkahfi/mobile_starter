// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserLocationState {
  AsyncValue<LocationItem?> get locationItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserLocationStateCopyWith<UserLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationStateCopyWith<$Res> {
  factory $UserLocationStateCopyWith(UserLocationState value, $Res Function(UserLocationState) then) =
      _$UserLocationStateCopyWithImpl<$Res, UserLocationState>;
  @useResult
  $Res call({AsyncValue<LocationItem?> locationItem});
}

/// @nodoc
class _$UserLocationStateCopyWithImpl<$Res, $Val extends UserLocationState>
    implements $UserLocationStateCopyWith<$Res> {
  _$UserLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationItem = null,
  }) {
    return _then(_value.copyWith(
      locationItem: null == locationItem
          ? _value.locationItem
          : locationItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LocationItem?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserLocationStateCopyWith<$Res> implements $UserLocationStateCopyWith<$Res> {
  factory _$$_UserLocationStateCopyWith(
          _$_UserLocationState value, $Res Function(_$_UserLocationState) then) =
      __$$_UserLocationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<LocationItem?> locationItem});
}

/// @nodoc
class __$$_UserLocationStateCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res, _$_UserLocationState>
    implements _$$_UserLocationStateCopyWith<$Res> {
  __$$_UserLocationStateCopyWithImpl(
      _$_UserLocationState _value, $Res Function(_$_UserLocationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationItem = null,
  }) {
    return _then(_$_UserLocationState(
      locationItem: null == locationItem
          ? _value.locationItem
          : locationItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LocationItem?>,
    ));
  }
}

/// @nodoc

class _$_UserLocationState implements _UserLocationState {
  const _$_UserLocationState({this.locationItem = const AsyncValue.data(null)});

  @override
  @JsonKey()
  final AsyncValue<LocationItem?> locationItem;

  @override
  String toString() {
    return 'UserLocationState(locationItem: $locationItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLocationState &&
            (identical(other.locationItem, locationItem) || other.locationItem == locationItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLocationStateCopyWith<_$_UserLocationState> get copyWith =>
      __$$_UserLocationStateCopyWithImpl<_$_UserLocationState>(this, _$identity);
}

abstract class _UserLocationState implements UserLocationState {
  const factory _UserLocationState({final AsyncValue<LocationItem?> locationItem}) = _$_UserLocationState;

  @override
  AsyncValue<LocationItem?> get locationItem;
  @override
  @JsonKey(ignore: true)
  _$$_UserLocationStateCopyWith<_$_UserLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}
