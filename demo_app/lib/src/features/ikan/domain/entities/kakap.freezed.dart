// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kakap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Kakap {
// TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KakapCopyWith<Kakap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KakapCopyWith<$Res> {
  factory $KakapCopyWith(Kakap value, $Res Function(Kakap) then) =
      _$KakapCopyWithImpl<$Res, Kakap>;
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class _$KakapCopyWithImpl<$Res, $Val extends Kakap>
    implements $KakapCopyWith<$Res> {
  _$KakapCopyWithImpl(this._value, this._then);

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
abstract class _$$_KakapCopyWith<$Res> implements $KakapCopyWith<$Res> {
  factory _$$_KakapCopyWith(_$_Kakap value, $Res Function(_$_Kakap) then) =
      __$$_KakapCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class __$$_KakapCopyWithImpl<$Res> extends _$KakapCopyWithImpl<$Res, _$_Kakap>
    implements _$$_KakapCopyWith<$Res> {
  __$$_KakapCopyWithImpl(_$_Kakap _value, $Res Function(_$_Kakap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_Kakap(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Kakap implements _Kakap {
  const _$_Kakap({@HiveField(0) this.id});

// TODO(yourgitusername): Change the field id
  @override
  @HiveField(0)
  final String? id;

  @override
  String toString() {
    return 'Kakap(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Kakap &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KakapCopyWith<_$_Kakap> get copyWith =>
      __$$_KakapCopyWithImpl<_$_Kakap>(this, _$identity);
}

abstract class _Kakap implements Kakap {
  const factory _Kakap({@HiveField(0) final String? id}) = _$_Kakap;

  @override // TODO(yourgitusername): Change the field id
  @HiveField(0)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_KakapCopyWith<_$_Kakap> get copyWith =>
      throw _privateConstructorUsedError;
}
