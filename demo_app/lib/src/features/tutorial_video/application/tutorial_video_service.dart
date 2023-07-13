
import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/features/tutorial_video/domain/entities/video_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TutorialVideoService {
  const TutorialVideoService();
  // final TutorialVideoRepository tutorialVideoRepository;


  Future<Result<VideoItem>> get videoItem async {
    // TODO(yourgitusername): connect to repositories or do something else
    return const Result.success(VideoItem());
  }
}


final tutorialVideoServiceProvider = Provider<TutorialVideoService>(
  (ref) => const TutorialVideoService(),);
