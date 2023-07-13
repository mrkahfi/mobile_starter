import 'package:demo_app/src/features/tutorial_video/domain/entities/video_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_video_state.freezed.dart';

@freezed
class TutorialVideoState with _$TutorialVideoState {
  const factory TutorialVideoState({
    @Default(AsyncValue.data(null)) AsyncValue<VideoItem?> videoItem,
  }) = _TutorialVideoState;
}
