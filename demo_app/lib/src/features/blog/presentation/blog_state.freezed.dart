// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlogState {
  AsyncValue<ArticleItem?> get articleItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlogStateCopyWith<BlogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogStateCopyWith<$Res> {
  factory $BlogStateCopyWith(BlogState value, $Res Function(BlogState) then) =
      _$BlogStateCopyWithImpl<$Res, BlogState>;
  @useResult
  $Res call({AsyncValue<ArticleItem?> articleItem});
}

/// @nodoc
class _$BlogStateCopyWithImpl<$Res, $Val extends BlogState>
    implements $BlogStateCopyWith<$Res> {
  _$BlogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleItem = null,
  }) {
    return _then(_value.copyWith(
      articleItem: null == articleItem
          ? _value.articleItem
          : articleItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ArticleItem?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlogStateCopyWith<$Res> implements $BlogStateCopyWith<$Res> {
  factory _$$_BlogStateCopyWith(
          _$_BlogState value, $Res Function(_$_BlogState) then) =
      __$$_BlogStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<ArticleItem?> articleItem});
}

/// @nodoc
class __$$_BlogStateCopyWithImpl<$Res>
    extends _$BlogStateCopyWithImpl<$Res, _$_BlogState>
    implements _$$_BlogStateCopyWith<$Res> {
  __$$_BlogStateCopyWithImpl(
      _$_BlogState _value, $Res Function(_$_BlogState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleItem = null,
  }) {
    return _then(_$_BlogState(
      articleItem: null == articleItem
          ? _value.articleItem
          : articleItem // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ArticleItem?>,
    ));
  }
}

/// @nodoc

class _$_BlogState implements _BlogState {
  const _$_BlogState({this.articleItem = const AsyncValue.data(null)});

  @override
  @JsonKey()
  final AsyncValue<ArticleItem?> articleItem;

  @override
  String toString() {
    return 'BlogState(articleItem: $articleItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlogState &&
            (identical(other.articleItem, articleItem) || other.articleItem == articleItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articleItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlogStateCopyWith<_$_BlogState> get copyWith =>
      __$$_BlogStateCopyWithImpl<_$_BlogState>(this, _$identity);
}

abstract class _BlogState implements BlogState {
  const factory _BlogState({final AsyncValue<ArticleItem?> articleItem}) = _$_BlogState;

  @override
  AsyncValue<ArticleItem?> get articleItem;
  @override
  @JsonKey(ignore: true)
  _$$_BlogStateCopyWith<_$_BlogState> get copyWith =>
      throw _privateConstructorUsedError;
}
