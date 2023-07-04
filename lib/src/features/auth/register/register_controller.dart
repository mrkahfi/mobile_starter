import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:zot_starter/src/commons/data/datasource/remote/config/result.dart';
import 'package:zot_starter/src/commons/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/commons/domain/entities/user.dart';
import 'package:zot_starter/src/commons/domain/formz/formz.dart';
import 'package:zot_starter/src/features/auth/register/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this.ref) : super(const RegisterState());

  final Ref ref;

  FormzStatus validate({
    EmailFormz? email,
    PasswordFormz? password,
    ConfirmPasswordFormz? password2,
  }) {
    return Formz.validate([
      email ?? state.email,
      password ?? state.password,
      password2 ?? state.password2,
    ]);
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

  void updatePassword2(String value) {
    final password2 = ConfirmPasswordFormz.dirty(
      value,
      other: state.password.value,
    );

    state = state.copyWith(
      password2: password2,
      status: validate(password2: password2),
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
      ref.read(authRepositoryProvider).login(email, password);
}

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>(
  RegisterController.new,
);
