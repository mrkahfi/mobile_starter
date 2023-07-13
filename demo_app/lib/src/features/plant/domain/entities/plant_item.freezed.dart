// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlantItem {
// TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlantItemCopyWith<PlantItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantItemCopyWith<$Res> {
  factory $PlantItemCopyWith(PlantItem value, $Res Function(PlantItem) then) =
      _$PlantItemCopyWithImpl<$Res, PlantItem>;
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class _$PlantItemCopyWithImpl<$Res, $Val extends PlantItem>
    implements $PlantItemCopyWith<$Res> {
  _$PlantItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_PlantItemCopyWith<$Res> implements $PlantItemCopyWith<$Res> {
  factory _$$_PlantItemCopyWith(_$_PlantItem value, $Res Function(_$_PlantItem) then) =
      __$$_PlantItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class __$$_PlantItemCopyWithImpl<$Res> extends _$PlantItemCopyWithImpl<$Res, _$_PlantItem>
    implements _$$_PlantItemCopyWith<$Res> {
  __$$_PlantItemCopyWithImpl(_$_PlantItem _value, $Res Function(_$_PlantItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_PlantItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PlantItem implements _PlantItem {
  const _$_PlantItem({@HiveField(0) this.id});

// TODO(yourgitusername): Change the field id
  @override
  @HiveField(0)
  final String? id;

  @override
  String toString() {
    return 'PlantItem(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlantItem &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlantItemCopyWith<_$_PlantItem> get copyWith =>
      __$$_PlantItemCopyWithImpl<_$_PlantItem>(this, _$identity);
}

abstract class _PlantItem implements PlantItem {
  const factory _PlantItem({@HiveField(0) final String? id}) = _$_PlantItem;

  @override // TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_PlantItemCopyWith<_$_PlantItem> get copyWith =>
      throw _privateConstructorUsedError;
}
