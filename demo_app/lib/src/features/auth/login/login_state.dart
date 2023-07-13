import 'package:demo_app/src/commons/domain/entities/user.dart';
import 'package:demo_app/src/commons/domain/formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(AsyncValue.data(null)) AsyncValue<User?> value,
  }) = _LoginState;
}
