import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart' hide Assets;
import 'package:zot_starter/src/app/themes/constants/themes.dart';
import 'package:zot_starter/src/commons/ui_components/button.dart';
import 'package:zot_starter/src/commons/ui_components/textfield.dart';
import 'package:zot_starter/src/features/auth/login/login_controller.dart';
import 'package:zot_starter/src/features/auth/widget/social_media_login.dart';
import 'package:zot_starter/src/routing/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(),
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
            Gap.h16,
            const LoginSocialMediaSection()
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

  String get email => _emailEditingController.value.text;
  String get password => _passwordEditingController.value.text;

  @override
  Widget build(BuildContext context) {
    _listenAuth(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextfield(
          controller: _emailEditingController,
          hintText: 'Email',
          label: 'Email',
          inputType: TextInputType.emailAddress,
        ),
        Gap.h24,
        CommonTextfield(
          controller: _passwordEditingController,
          hintText: 'Password',
          label: 'Password',
        ),
        Gap.h4,
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: const Text(
              'Forgot Password?',
            ),
          ),
        ),
        Gap.h24,
        Row(
          children: [
            Expanded(
              child: CommonButton(
                'Register',
                isLoading: ref.watch(loginControllerProvider).value.isLoading,
                onPressed: () => ref
                    .read(loginControllerProvider.notifier)
                    .submit(email, password),
              ),
            ),
            Gap.w12,
            ZeroButtonIcon.primary(
              icon: const Icon(Icons.fingerprint),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  void _listenAuth(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next) {
      if (previous == null) return;

      context.goNamed(Routes.main.name);
    });
  }
}
