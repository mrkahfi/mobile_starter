// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ikan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IkanState {
  AsyncValue<Kakap?> get kakap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IkanStateCopyWith<IkanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IkanStateCopyWith<$Res> {
  factory $IkanStateCopyWith(IkanState value, $Res Function(IkanState) then) =
      _$IkanStateCopyWithImpl<$Res, IkanState>;
  @useResult
  $Res call({AsyncValue<Kakap?> kakap});
}

/// @nodoc
class _$IkanStateCopyWithImpl<$Res, $Val extends IkanState>
    implements $IkanStateCopyWith<$Res> {
  _$IkanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kakap = null,
  }) {
    return _then(_value.copyWith(
      kakap: null == kakap
          ? _value.kakap
          : kakap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Kakap?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IkanStateCopyWith<$Res> implements $IkanStateCopyWith<$Res> {
  factory _$$_IkanStateCopyWith(
          _$_IkanState value, $Res Function(_$_IkanState) then) =
      __$$_IkanStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<Kakap?> kakap});
}

/// @nodoc
class __$$_IkanStateCopyWithImpl<$Res>
    extends _$IkanStateCopyWithImpl<$Res, _$_IkanState>
    implements _$$_IkanStateCopyWith<$Res> {
  __$$_IkanStateCopyWithImpl(
      _$_IkanState _value, $Res Function(_$_IkanState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kakap = null,
  }) {
    return _then(_$_IkanState(
      kakap: null == kakap
          ? _value.kakap
          : kakap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Kakap?>,
    ));
  }
}

/// @nodoc

class _$_IkanState implements _IkanState {
  const _$_IkanState({this.kakap = const AsyncValue.data(null)});

  @override
  @JsonKey()
  final AsyncValue<Kakap?> kakap;

  @override
  String toString() {
    return 'IkanState(kakap: $kakap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IkanState &&
            (identical(other.kakap, kakap) || other.kakap == kakap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kakap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IkanStateCopyWith<_$_IkanState> get copyWith =>
      __$$_IkanStateCopyWithImpl<_$_IkanState>(this, _$identity);
}

abstract class _IkanState implements IkanState {
  const factory _IkanState({final AsyncValue<Kakap?> kakap}) = _$_IkanState;

  @override
  AsyncValue<Kakap?> get kakap;
  @override
  @JsonKey(ignore: true)
  _$$_IkanStateCopyWith<_$_IkanState> get copyWith =>
      throw _privateConstructorUsedError;
}
