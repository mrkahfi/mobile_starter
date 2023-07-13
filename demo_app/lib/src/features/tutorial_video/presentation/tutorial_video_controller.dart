

import 'package:demo_app/src/features/tutorial_video/application/tutorial_video_service.dart';
import 'package:demo_app/src/features/tutorial_video/presentation/tutorial_video_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class  TutorialVideoController extends StateNotifier<TutorialVideoState> {
  TutorialVideoController(this.ref) : super(const TutorialVideoState());
  final Ref ref;

  Future<void> getVideoItem() async {
    state = state.copyWith(videoItem: const AsyncLoading());
    
    final result = await ref.read(tutorialVideoServiceProvider).videoItem;

    result.when(
      success: (data) {
        state = state.copyWith(videoItem: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(videoItem: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  tutorialVideoControllerProvider =
    StateNotifierProvider<TutorialVideoController, TutorialVideoState>(
      TutorialVideoController.new,);
