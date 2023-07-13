// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorialVideoState {
  AsyncValue<VideoItem?> get videoItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorialVideoStateCopyWith<TutorialVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialVideoStateCopyWith<$Res> {
  factory $TutorialVideoStateCopyWith(TutorialVideoState value, $Res Function(TutorialVideoState) then) =
      _$TutorialVideoStateCopyWithImpl<$Res, TutorialVideoState>;
  @useResult
  $Res call({AsyncValue<VideoItem?> videoItem});
}

/// @nodoc
class _$TutorialVideoStateCopyWithImpl<$Res, $Val extends TutorialVideoState>
    implements $TutorialVideoStateCopyWith<$Res> {
  _$TutorialVideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoItem = null,
  }) {
    return _then(_value.copyWith(
      videoItem: null == videoItem
          ? _value.videoItem
          : videoItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<VideoItem?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorialVideoStateCopyWith<$Res> implements $TutorialVideoStateCopyWith<$Res> {
  factory _$$_TutorialVideoStateCopyWith(
          _$_TutorialVideoState value, $Res Function(_$_TutorialVideoState) then) =
      __$$_TutorialVideoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<VideoItem?> videoItem});
}

/// @nodoc
class __$$_TutorialVideoStateCopyWithImpl<$Res>
    extends _$TutorialVideoStateCopyWithImpl<$Res, _$_TutorialVideoState>
    implements _$$_TutorialVideoStateCopyWith<$Res> {
  __$$_TutorialVideoStateCopyWithImpl(
      _$_TutorialVideoState _value, $Res Function(_$_TutorialVideoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoItem = null,
  }) {
    return _then(_$_TutorialVideoState(
      videoItem: null == videoItem
          ? _value.videoItem
          : videoItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<VideoItem?>,
    ));
  }
}

/// @nodoc

class _$_TutorialVideoState implements _TutorialVideoState {
  const _$_TutorialVideoState({this.videoItem = const AsyncValue.data(null)});

  @override
  @JsonKey()
  final AsyncValue<VideoItem?> videoItem;

  @override
  String toString() {
    return 'TutorialVideoState(videoItem: $videoItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorialVideoState &&
            (identical(other.videoItem, videoItem) || other.videoItem == videoItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorialVideoStateCopyWith<_$_TutorialVideoState> get copyWith =>
      __$$_TutorialVideoStateCopyWithImpl<_$_TutorialVideoState>(this, _$identity);
}

abstract class _TutorialVideoState implements TutorialVideoState {
  const factory _TutorialVideoState({final AsyncValue<VideoItem?> videoItem}) = _$_TutorialVideoState;

  @override
  AsyncValue<VideoItem?> get videoItem;
  @override
  @JsonKey(ignore: true)
  _$$_TutorialVideoStateCopyWith<_$_TutorialVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
