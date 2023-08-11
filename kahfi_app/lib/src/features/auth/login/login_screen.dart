import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:kahfi_app/src/app/constants/constants.dart';
import 'package:kahfi_app/src/common/components/button.dart';
import 'package:kahfi_app/src/common/components/textfield.dart';
import 'package:kahfi_app/src/features/auth/login/login_controller.dart';
import 'package:kahfi_app/src/features/auth/widget/social_media_login.dart';
import 'package:kahfi_app/src/localization/locale_keys.g.dart';
import 'package:kahfi_app/src/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: horizontalPadding,
        child: Column(
          children: [
            Gap.h16,
            const LoginHeaderSection(),
            Gap.h16,
            const Divider(
              thickness: 1,
              height: 0,
            ),
            Gap.h24,
            const LoginInputSection(),
            Gap.h16,
            const LoginSocialMediaSection()
          ],
        ),
      ),
    );
  }
}

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.pushNamed(Routes.register.name),
        child: const Text('Register'),
      ),
    );
  }
}

class LoginInputSection extends ConsumerStatefulWidget {
  const LoginInputSection({
    super.key,
    this.isLoginAsResult = false,
  });

  final bool isLoginAsResult;

  @override
  ConsumerState<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends ConsumerState<LoginInputSection> {
  bool isPasswordObscure = true;
  bool hasBiometric = true;

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _listenAuth(context);

    final emailForm = ref.watch(loginControllerProvider).email;
    final passwordForm = ref.watch(loginControllerProvider).password;

    log('status ${ref.watch(loginControllerProvider).status}');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextfield(
          controller: _emailEditingController,
          hintText: tr(LocaleKeys.email),
          label: LocaleKeys.email.tr(),
          onChanged: (value) =>
              ref.read(loginControllerProvider.notifier).updateEmail(value),
          inputType: TextInputType.emailAddress,
          validator: (value) => emailForm.error?.message,
        ),
        Gap.h4,
        CommonTextfield(
          controller: _passwordEditingController,
          hintText: tr(LocaleKeys.password),
          label: LocaleKeys.password.tr(),
          obscureText: true,
          onChanged: (value) =>
              ref.read(loginControllerProvider.notifier).updatePassword(value),
          validator: (value) => passwordForm.error?.message,
        ),
        Gap.h4,
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: const Text('Forgot Password?'),
          ),
        ),
        Gap.h24,
        Row(
          children: [
            Expanded(
              child: CommonButton(
                'Login',
                isDisabled: ref.watch(loginControllerProvider).status !=
                    FormzStatus.valid,
                isLoading: ref.watch(loginControllerProvider).value.isLoading,
                onPressed: () => ref
                    .read(loginControllerProvider.notifier)
                    .submit(emailForm.value, passwordForm.value),
              ),
            ),
            Gap.w12,
            ElevatedButton(
              child: Icon(
                Icons.fingerprint,
                color:
                    Theme.of(context).extension<AppColors>()!.buttonTextColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  void _listenAuth(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next) {
      final justAuthenticated = next.status == FormzStatus.submissionSuccess;

      if (justAuthenticated) {
        context.goNamed(Routes.main.name);
      }
    });
  }
}
