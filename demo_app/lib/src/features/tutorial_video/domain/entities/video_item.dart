import 'package:demo_app/src/commons/data/sources/sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'video_item.freezed.dart';
part 'video_item.g.dart';

/// Entity description
/// Add [VideoItemAdapter] to [HiveDB].init()
@freezed
@HiveType(typeId: 1) // TODO(yourgitusername): Change `typeId`
class VideoItem with _$VideoItem {
  const factory VideoItem({
    // TODO(yourgitusername): Change the field id
    @HiveField(0) String? id,
  }) = _VideoItem;
}
