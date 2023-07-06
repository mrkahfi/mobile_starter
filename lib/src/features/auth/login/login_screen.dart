import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:zog_ui/zog_ui.dart' hide Assets;
import 'package:zot_starter/src/app/themes/foundation/sizes.dart';
import 'package:zot_starter/src/commons/ui_components/button.dart';
import 'package:zot_starter/src/commons/ui_components/textfield.dart';
import 'package:zot_starter/src/features/auth/login/login_controller.dart';
import 'package:zot_starter/src/features/auth/widget/social_media_login.dart';
import 'package:zot_starter/src/localization/locale_keys.g.dart';
import 'package:zot_starter/src/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: horizontalPadding,
        child: Column(
          children: [
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
            ZeroButtonIcon.primary(
              borderRadiusType: ZeroButtonRadiusType.curved,
              size: ZeroButtonSize.large,
              icon: const Icon(Icons.fingerprint),
              style: const ZeroButtonIconStyle(iconSize: 24),
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
