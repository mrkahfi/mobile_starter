import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart' hide Assets;
import 'package:zot_starter/src/app/themes/foundation/sizes.dart';
import 'package:zot_starter/src/commons/ui_components/button.dart';
import 'package:zot_starter/src/commons/ui_components/textfield.dart';
import 'package:zot_starter/src/features/auth/login/login_controller.dart';
import 'package:zot_starter/src/features/auth/widget/social_media_login.dart';
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
            child: const Text('Forgot Password?'),
          ),
        ),
        Gap.h24,
        Row(
          children: [
            Expanded(
              child: CommonButton(
                'Login',
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
