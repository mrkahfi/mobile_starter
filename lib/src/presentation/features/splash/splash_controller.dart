import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/presentation/features/splash/splash_state.dart';
import 'package:zot_starter/src/services/app_service.dart';

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
