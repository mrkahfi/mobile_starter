import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:zot_starter/src/commons/data/datasource/sources.dart';
import 'package:zot_starter/src/commons/domain/entities/user.dart';
import 'package:zot_starter/src/commons/domain/formz/formz.dart';
import 'package:zot_starter/src/commons/services/auth_service.dart';
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
    await AsyncValue.guard(() async {
      final response = await _authenticate(email, password);
      response.when(
        success: (data) => state = state.copyWith(
          value: AsyncValue.data(data),
          status: FormzStatus.submissionSuccess,
        ),
        failure: (error, stackTrace) => state = state.copyWith(
          status: FormzStatus.submissionFailure,
        ),
      );
    });
  }

  Future<Result<User>> _authenticate(String email, String password) async =>
      ref.read(authServiceProvider).login(email, password);
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  LoginController.new,
);
