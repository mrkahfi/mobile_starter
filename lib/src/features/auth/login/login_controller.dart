import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:zot_starter/src/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/domain/formz/formz.dart';
import 'package:zot_starter/src/features/auth/login/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginState());

  final Ref ref;

  FormzStatus validate({EmailFormz? email, PasswordFormz? password}) {
    return Formz.validate([email ?? state.email, password ?? state.password]);
  }

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(email: email, status: validate(email: email));
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);
    state = state.copyWith(
      password: password,
      status: validate(password: password),
    );
  }

  Future<void> submit(String email, String password) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(() => _authenticate(email, password));
    state = state.copyWith(value: value);
  }

  Future<void> _authenticate(String email, String password) async {
    await ref.read(authRepositoryProvider).login(email, password);
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  LoginController.new,
);