import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart' hide Assets;
import 'package:zot_starter/gen/assets.gen.dart';
import 'package:zot_starter/src/app/themes/foundation/sizes.dart';

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
        const Align(
          child: Text('Login instantly using your social media'),
        ),
        Gap.h24,
        ZeroButton.primary(
          child: Row(
            children: [
              Assets.icons.appleIcon.svg(),
              Gap.w12,
              const Text('Continue with Apple'),
            ],
          ),
          onPressed: () {},
        ),
        Gap.h16,
        ZeroButton.primary(
          child: Row(
            children: [
              Assets.icons.googleIcon.svg(),
              Gap.w12,
              const Text('Continue with Google'),
            ],
          ),
          onPressed: () {},
        ),
        Gap.h16,
        ZeroButton.primary(
          child: Row(
            children: [
              Assets.icons.facebookIcon.svg(),
              Gap.w12,
              const Text('Continue with Facebook'),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
