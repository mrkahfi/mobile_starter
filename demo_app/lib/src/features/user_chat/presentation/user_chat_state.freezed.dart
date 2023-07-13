// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserChatState {
  AsyncValue<Message?> get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserChatStateCopyWith<UserChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChatStateCopyWith<$Res> {
  factory $UserChatStateCopyWith(UserChatState value, $Res Function(UserChatState) then) =
      _$UserChatStateCopyWithImpl<$Res, UserChatState>;
  @useResult
  $Res call({AsyncValue<Message?> message});
}

/// @nodoc
class _$UserChatStateCopyWithImpl<$Res, $Val extends UserChatState>
    implements $UserChatStateCopyWith<$Res> {
  _$UserChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Message?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserChatStateCopyWith<$Res> implements $UserChatStateCopyWith<$Res> {
  factory _$$_UserChatStateCopyWith(
          _$_UserChatState value, $Res Function(_$_UserChatState) then) =
      __$$_UserChatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<Message?> message});
}

/// @nodoc
class __$$_UserChatStateCopyWithImpl<$Res>
    extends _$UserChatStateCopyWithImpl<$Res, _$_UserChatState>
    implements _$$_UserChatStateCopyWith<$Res> {
  __$$_UserChatStateCopyWithImpl(
      _$_UserChatState _value, $Res Function(_$_UserChatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_UserChatState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Message?>,
    ));
  }
}

/// @nodoc

class _$_UserChatState implements _UserChatState {
  const _$_UserChatState({this.message = const AsyncValue.data(null)});

  @override
  @JsonKey()
  final AsyncValue<Message?> message;

  @override
  String toString() {
    return 'UserChatState(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserChatState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserChatStateCopyWith<_$_UserChatState> get copyWith =>
      __$$_UserChatStateCopyWithImpl<_$_UserChatState>(this, _$identity);
}

abstract class _UserChatState implements UserChatState {
  const factory _UserChatState({final AsyncValue<Message?> message}) = _$_UserChatState;

  @override
  AsyncValue<Message?> get message;
  @override
  @JsonKey(ignore: true)
  _$$_UserChatStateCopyWith<_$_UserChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
