
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'message.freezed.dart';
part 'message.g.dart';

/// Entity description
/// TODO(yourgitusername): Add [MessageAdapter] to [HiveDB.init()]
@freezed
@HiveType(typeId: 1) // TODO(yourgitusername): Change `typeId`
class Message with _$Message {
  const factory Message({
    // TODO(yourgitusername): Change the field id
    @HiveField(0) String? id,
  }) = _Message;

}
