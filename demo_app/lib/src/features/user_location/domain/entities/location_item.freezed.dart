// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationItem {
// TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationItemCopyWith<LocationItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationItemCopyWith<$Res> {
  factory $LocationItemCopyWith(LocationItem value, $Res Function(LocationItem) then) =
      _$LocationItemCopyWithImpl<$Res, LocationItem>;
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class _$LocationItemCopyWithImpl<$Res, $Val extends LocationItem>
    implements $LocationItemCopyWith<$Res> {
  _$LocationItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_LocationItemCopyWith<$Res> implements $LocationItemCopyWith<$Res> {
  factory _$$_LocationItemCopyWith(_$_LocationItem value, $Res Function(_$_LocationItem) then) =
      __$$_LocationItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class __$$_LocationItemCopyWithImpl<$Res> extends _$LocationItemCopyWithImpl<$Res, _$_LocationItem>
    implements _$$_LocationItemCopyWith<$Res> {
  __$$_LocationItemCopyWithImpl(_$_LocationItem _value, $Res Function(_$_LocationItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_LocationItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocationItem implements _LocationItem {
  const _$_LocationItem({@HiveField(0) this.id});

// TODO(yourgitusername): Change the field id
  @override
  @HiveField(0)
  final String? id;

  @override
  String toString() {
    return 'LocationItem(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationItem &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationItemCopyWith<_$_LocationItem> get copyWith =>
      __$$_LocationItemCopyWithImpl<_$_LocationItem>(this, _$identity);
}

abstract class _LocationItem implements LocationItem {
  const factory _LocationItem({@HiveField(0) final String? id}) = _$_LocationItem;

  @override // TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_LocationItemCopyWith<_$_LocationItem> get copyWith =>
      throw _privateConstructorUsedError;
}
