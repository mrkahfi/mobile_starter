import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_components/ui_components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Register'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: horizontalPadding,
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
    );
  }
}

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.pop(),
        child: Text(
          'Login',
          style: TypographyTheme.subtitle1Medium.w600,
        ),
      ),
    );
  }
}

class LoginInputSection extends StatefulWidget {
  const LoginInputSection({
    super.key,
    this.isLoginAsResult = false,
  });

  final bool isLoginAsResult;

  @override
  State<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends State<LoginInputSection> {
  bool isPasswordObscure = true;
  bool hasBiometric = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputFormWidget(
          controller: TextEditingController(),
          hintText: 'Email',
          hasIconState: false,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          hasBorderState: false,
        ),
        Gap.h24,
        InputFormWidget.password(
          controller: TextEditingController(),
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
            const Expanded(
              child: ButtonWidget.primary(
                text: 'Login',
                isEnabled: true,
              ),
            ),
            Gap.w12,
            ButtonWidget.primaryIcon(
              icon: Assets.icons.fingerprintIcon.svg(
                height: SizeApp.customHeight(18),
                width: SizeApp.customHeight(18),
                color: hasBiometric ? ColorApp.white : ColorApp.greyMedium2,
                package: 'ui_components',
              ),
              isEnabled: true,
            ),
          ],
        ),
      ],
    );
  }
}
