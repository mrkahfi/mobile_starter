// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogoutState {
  AsyncValue<bool> get isSuccessful => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogoutStateCopyWith<LogoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutStateCopyWith<$Res> {
  factory $LogoutStateCopyWith(
          LogoutState value, $Res Function(LogoutState) then) =
      _$LogoutStateCopyWithImpl<$Res, LogoutState>;
  @useResult
  $Res call({AsyncValue<bool> isSuccessful});
}

/// @nodoc
class _$LogoutStateCopyWithImpl<$Res, $Val extends LogoutState>
    implements $LogoutStateCopyWith<$Res> {
  _$LogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccessful = null,
  }) {
    return _then(_value.copyWith(
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LogoutStateCopyWith<$Res>
    implements $LogoutStateCopyWith<$Res> {
  factory _$$_LogoutStateCopyWith(
          _$_LogoutState value, $Res Function(_$_LogoutState) then) =
      __$$_LogoutStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<bool> isSuccessful});
}

/// @nodoc
class __$$_LogoutStateCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$_LogoutState>
    implements _$$_LogoutStateCopyWith<$Res> {
  __$$_LogoutStateCopyWithImpl(
      _$_LogoutState _value, $Res Function(_$_LogoutState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccessful = null,
  }) {
    return _then(_$_LogoutState(
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ));
  }
}

/// @nodoc

class _$_LogoutState implements _LogoutState {
  const _$_LogoutState({this.isSuccessful = const AsyncValue.data(false)});

  @override
  @JsonKey()
  final AsyncValue<bool> isSuccessful;

  @override
  String toString() {
    return 'LogoutState(isSuccessful: $isSuccessful)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogoutState &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccessful);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogoutStateCopyWith<_$_LogoutState> get copyWith =>
      __$$_LogoutStateCopyWithImpl<_$_LogoutState>(this, _$identity);
}

abstract class _LogoutState implements LogoutState {
  const factory _LogoutState({final AsyncValue<bool> isSuccessful}) =
      _$_LogoutState;

  @override
  AsyncValue<bool> get isSuccessful;
  @override
  @JsonKey(ignore: true)
  _$$_LogoutStateCopyWith<_$_LogoutState> get copyWith =>
      throw _privateConstructorUsedError;
}
