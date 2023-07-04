import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_components/ui_components.dart';
import 'package:zog_ui/zog_ui.dart' hide Assets;
import 'package:zot_starter/src/features/auth/login/login_controller.dart';
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
              color: ColorApp.greyMedium2,
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
        child: Text(
          'Register',
          style: TypographyTheme.subtitle1Medium.w600,
        ),
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
        InputFormWidget(
          controller: _emailEditingController,
          hintText: 'Email',
          hasIconState: false,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          hasBorderState: false,
        ),
        Gap.h24,
        InputFormWidget.password(
          controller: _passwordEditingController,
          hintText: 'Password',
          label: 'Password',
          isObscure: isPasswordObscure,
          onObscureTap: () {
            setState(() {
              isPasswordObscure = !isPasswordObscure;
            });
          },
          hasBorderState: false,
        ),
        Gap.h4,
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot Password?',
              style: TypographyTheme.body,
            ),
          ),
        ),
        Gap.h24,
        Row(
          children: [
            Expanded(
              child: ButtonWidget.primary(
                text: 'Login',
                isEnabled: true,
                isLoading: ref.watch(loginControllerProvider).value.isLoading,
                onTap: () => ref
                    .read(loginControllerProvider.notifier)
                    .submit(email, password),
              ),
            ),
            Gap.w12,
            ButtonWidget.primaryIcon(
              icon: Assets.icons.fingerprintIcon.svg(
                width: SizeApp.customHeight(18),
                theme: SvgTheme(
                  currentColor:
                      hasBiometric ? ColorApp.white : ColorApp.greyMedium2,
                ),
                package: 'ui_components',
              ),
              isEnabled: true,
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