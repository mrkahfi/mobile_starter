import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class LoginSocialMediaSection extends StatelessWidget {
  const LoginSocialMediaSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          child: Text(
            'Login instantly using your social media',
            style: TypographyTheme.body.toGreyMedium2,
          ),
        ),
        Gap.h24,
        ButtonWidget.secondary(
          text: 'Continue with Apple',
          icon: Assets.icons.appleIcon.svg(
            package: 'ui_components',
          ),
          isSmallSize: true,
          onTap: () {},
        ),
        Gap.h16,
        ButtonWidget.secondary(
          text: 'Continue with Google',
          icon: Assets.icons.googleIcon.svg(
            package: 'ui_components',
          ),
          isSmallSize: true,
          onTap: () {},
        ),
        Gap.h16,
        ButtonWidget.secondary(
          text: 'Continue with Facebook',
          icon: Assets.icons.facebookIcon.svg(
            package: 'ui_components',
          ),
          isSmallSize: true,
          onTap: () {},
        ),
      ],
    );
  }
}
