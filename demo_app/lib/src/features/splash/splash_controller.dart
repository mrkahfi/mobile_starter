import 'package:demo_app/src/commons/services/app_service.dart';
import 'package:demo_app/src/features/splash/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashController extends StateNotifier<SplashState> {
  SplashController(this.ref) : super(const SplashState());
  final Ref ref;

  Future<void> loading() async {
    state = state.copyWith(isLoading: true);
    final appService = ref.watch(appServiceProvider);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        state = state.copyWith(isLoading: false);
        appService.initialized = true;
      },
    );
  }
}

final splashControllerProvider =
    StateNotifierProvider<SplashController, SplashState>((ref) {
  final homeController = SplashController(ref)..loading();
  return homeController;
});
