// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleItem {
// TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleItemCopyWith<ArticleItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleItemCopyWith<$Res> {
  factory $ArticleItemCopyWith(ArticleItem value, $Res Function(ArticleItem) then) =
      _$ArticleItemCopyWithImpl<$Res, ArticleItem>;
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class _$ArticleItemCopyWithImpl<$Res, $Val extends ArticleItem>
    implements $ArticleItemCopyWith<$Res> {
  _$ArticleItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_ArticleItemCopyWith<$Res> implements $ArticleItemCopyWith<$Res> {
  factory _$$_ArticleItemCopyWith(_$_ArticleItem value, $Res Function(_$_ArticleItem) then) =
      __$$_ArticleItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class __$$_ArticleItemCopyWithImpl<$Res> extends _$ArticleItemCopyWithImpl<$Res, _$_ArticleItem>
    implements _$$_ArticleItemCopyWith<$Res> {
  __$$_ArticleItemCopyWithImpl(_$_ArticleItem _value, $Res Function(_$_ArticleItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_ArticleItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ArticleItem implements _ArticleItem {
  const _$_ArticleItem({@HiveField(0) this.id});

// TODO(yourgitusername): Change the field id
  @override
  @HiveField(0)
  final String? id;

  @override
  String toString() {
    return 'ArticleItem(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleItem &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleItemCopyWith<_$_ArticleItem> get copyWith =>
      __$$_ArticleItemCopyWithImpl<_$_ArticleItem>(this, _$identity);
}

abstract class _ArticleItem implements ArticleItem {
  const factory _ArticleItem({@HiveField(0) final String? id}) = _$_ArticleItem;

  @override // TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleItemCopyWith<_$_ArticleItem> get copyWith =>
      throw _privateConstructorUsedError;
}
