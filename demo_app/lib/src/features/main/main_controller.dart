import 'package:demo_app/src/commons/services/app_service.dart';
import 'package:demo_app/src/features/main/main_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppController extends StateNotifier<AppState> {
  AppController(this.ref) : super(const AppState());

  final Ref ref;

  void toggleThemeMode() {
    final newTheme = ref.watch(appServiceProvider).toggleThemeMode();
    state = state.copyWith(currentTheme: newTheme);
  }
}

final mainControllerProvider =
    StateNotifierProvider<AppController, AppState>(AppController.new);
