import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:kahfi_app/src/common/domain/formz/formz.dart';
import 'package:kahfi_app/src/common/services/auth_service.dart';
import 'package:kahfi_app/src/features/auth/login/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginState());

  final Ref ref;

  FormzStatus validate({EmailFormz? email, PasswordFormz? password}) {
    return Formz.validate([email ?? state.email, password ?? state.password]);
  }

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(
      email: email,
      status: validate(email: email),
    );
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

    final response = await ref.read(authServiceProvider).login(email, password);

    response.when(
      success: (data) {
        state = state.copyWith(
          value: AsyncValue.data(data),
          status: FormzStatus.submissionSuccess,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(status: FormzStatus.submissionFailure);
      },
    );
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  LoginController.new,
);
