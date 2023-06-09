import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_baru/src/features/main/main_state.dart';

class AppController extends StateNotifier<AppState> {
  AppController() : super(const AppState());

  void toggleThemeMode() {
    state = state.copyWith(
      currentTheme: state.currentTheme == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    );
  }
}

final mainControllerProvider =
    StateNotifierProvider<AppController, AppState>((ref) => AppController());
