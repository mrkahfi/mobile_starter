import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:zot_starter/src/app/themes/foundation/sizes.dart';
import 'package:zot_starter/src/commons/ui_components/button.dart';

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
          child: Text(
            'Login instantly using your social media',
          ),
        ),
        Gap.h24,
        ZeroButton.primary(
          child: const Row(
            children: [
              // Assets.icons.
              Text('Continue with Apple'),
            ],
          ),
          onPressed: () {},
        ),
        Gap.h16,
        CommonButton(
          'Continue with Google',
          onPressed: () {},
        ),
        Gap.h16,
        CommonButton(
          'Continue with Facebook',
          onPressed: () {},
        ),
      ],
    );
  }
}
