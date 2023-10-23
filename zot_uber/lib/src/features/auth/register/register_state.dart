import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zot_uber/src/common/domain/entities/user.dart';
import 'package:zot_uber/src/common/domain/formz/formz.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(ConfirmPasswordFormz.pure()) ConfirmPasswordFormz password2,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(AsyncValue.data(null)) AsyncValue<User?> value,
  }) = _RegisterState;
}
