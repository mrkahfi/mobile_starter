// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoItem {
// TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoItemCopyWith<VideoItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoItemCopyWith<$Res> {
  factory $VideoItemCopyWith(VideoItem value, $Res Function(VideoItem) then) =
      _$VideoItemCopyWithImpl<$Res, VideoItem>;
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class _$VideoItemCopyWithImpl<$Res, $Val extends VideoItem>
    implements $VideoItemCopyWith<$Res> {
  _$VideoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoItemCopyWith<$Res> implements $VideoItemCopyWith<$Res> {
  factory _$$_VideoItemCopyWith(_$_VideoItem value, $Res Function(_$_VideoItem) then) =
      __$$_VideoItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class __$$_VideoItemCopyWithImpl<$Res> extends _$VideoItemCopyWithImpl<$Res, _$_VideoItem>
    implements _$$_VideoItemCopyWith<$Res> {
  __$$_VideoItemCopyWithImpl(_$_VideoItem _value, $Res Function(_$_VideoItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_VideoItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_VideoItem implements _VideoItem {
  const _$_VideoItem({@HiveField(0) this.id});

// TODO(yourgitusername): Change the field id
  @override
  @HiveField(0)
  final String? id;

  @override
  String toString() {
    return 'VideoItem(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoItem &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoItemCopyWith<_$_VideoItem> get copyWith =>
      __$$_VideoItemCopyWithImpl<_$_VideoItem>(this, _$identity);
}

abstract class _VideoItem implements VideoItem {
  const factory _VideoItem({@HiveField(0) final String? id}) = _$_VideoItem;

  @override // TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_VideoItemCopyWith<_$_VideoItem> get copyWith =>
      throw _privateConstructorUsedError;
}
