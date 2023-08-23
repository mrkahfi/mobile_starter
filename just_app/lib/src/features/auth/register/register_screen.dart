import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:just_app/src/app/themes/foundation/sizes.dart';
import 'package:just_app/src/common/components/button.dart';
import 'package:just_app/src/common/components/textfield.dart';
import 'package:just_app/src/features/auth/register/register_controller.dart';
import 'package:just_app/src/localization/locale_keys.g.dart';
import 'package:just_app/src/routing/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: horizontalPadding,
        child: Column(
          children: [
            const RegisterHeaderSection(),
            Gap.h16,
            const Divider(
              thickness: 1,
              height: 0,
            ),
            Gap.h24,
            const RegisterInputSection(),
          ],
        ),
      ),
    );
  }
}

class RegisterHeaderSection extends StatelessWidget {
  const RegisterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.goNamed(Routes.login.name),
        child: const Text('Login'),
      ),
    );
  }
}

class RegisterInputSection extends ConsumerStatefulWidget {
  const RegisterInputSection({super.key});

  @override
  ConsumerState<RegisterInputSection> createState() =>
      _RegisterInputSectionState();
}

class _RegisterInputSectionState extends ConsumerState<RegisterInputSection> {
  bool isPasswordObscure = true;
  bool hasBiometric = true;

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _password2EditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailForm = ref.watch(registerControllerProvider).email;
    final passwordForm = ref.watch(registerControllerProvider).password;
    final password2Form = ref.watch(registerControllerProvider).password2;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CommonTextfield(
          controller: _emailEditingController,
          hintText: tr(LocaleKeys.email),
          label: LocaleKeys.email.tr(),
          onChanged: (value) =>
              ref.read(registerControllerProvider.notifier).updateEmail(value),
          inputType: TextInputType.emailAddress,
          validator: (value) => emailForm.error?.message,
        ),
        Gap.h4,
        CommonTextfield(
          controller: _passwordEditingController,
          hintText: tr(LocaleKeys.password),
          label: LocaleKeys.password.tr(),
          onChanged: (value) => ref
              .read(registerControllerProvider.notifier)
              .updatePassword(value),
          validator: (value) => passwordForm.error?.message,
        ),
        Gap.h4,
        CommonTextfield(
          controller: _password2EditingController,
          hintText: tr(LocaleKeys.hintConfirmPassword),
          label: LocaleKeys.labelFormConfirmPassword.tr(),
          obscureText: true,
          onChanged: (value) => ref
              .read(registerControllerProvider.notifier)
              .updatePassword2(value),
          validator: (value) => password2Form.error?.message,
        ),
        Gap.h4,
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: const Text('Forgot Password?'),
          ),
        ),
        Gap.h4,
        Gap.h24,
        CommonButton(
          'Register',
          isDisabled:
              ref.watch(registerControllerProvider).status != FormzStatus.valid,
          isLoading: ref.watch(registerControllerProvider).value.isLoading,
          onPressed: () => ref.read(registerControllerProvider.notifier).submit(
                emailForm.value,
                passwordForm.value,
                password2Form.value,
              ),
        ),
      ],
    );
  }
}
