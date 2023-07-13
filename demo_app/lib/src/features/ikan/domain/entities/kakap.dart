
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'kakap.freezed.dart';
part 'kakap.g.dart';

/// Entity description
/// TODO(yourgitusername): Add [KakapAdapter] to [HiveDB.init()]
@freezed
@HiveType(typeId: 1) // TODO(yourgitusername): Change `typeId`
class Kakap with _$Kakap {
  const factory Kakap({
    // TODO(yourgitusername): Change the field id
    @HiveField(0) String? id,
  }) = _Kakap;

}
