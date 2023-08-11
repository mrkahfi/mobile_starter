import 'package:flutter/material.dart';
import 'package:kahfi_app/gen/assets.gen.dart';
import 'package:kahfi_app/src/app/themes/foundation/sizes.dart';
import 'package:kahfi_app/src/common/components/button.dart';

class LoginSocialMediaSection extends StatelessWidget {
  const LoginSocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          child: Text('Login instantly using your social media'),
        ),
        Gap.h24,
        CommonButton.withIcon(
          'Continue with Google',
          icon: Assets.icons.googleIcon.svg(),
          onPressed: () {},
        ),
        Gap.h16,
        CommonButton.withIcon(
          'Continue with Apple',
          icon: Assets.icons.appleIcon.svg(),
          onPressed: () {},
        ),
        Gap.h16,
        CommonButton.withIcon(
          'Continue with Facebook',
          icon: Assets.icons.facebookIcon.svg(),
          onPressed: () {},
        ),
        Gap.h16,
      ],
    );
  }
}
