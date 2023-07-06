import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/services/auth_service.dart';
import 'package:zot_starter/src/features/auth/logout/logout_state.dart';

class LogoutController extends StateNotifier<LogoutState> {
  LogoutController(this.ref) : super(const LogoutState());

  final Ref ref;

  Future<void> logout() async {
    state = state.copyWith(isSuccessful: const AsyncValue.loading());
    await ref.read(authServiceProvider).logout();
    state = state.copyWith(isSuccessful: const AsyncValue.data(true));
  }
}

final logoutControllerProvider =
    StateNotifierProvider<LogoutController, LogoutState>(
  LogoutController.new,
);
