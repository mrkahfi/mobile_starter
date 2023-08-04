import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/gen/assets.gen.dart';
import 'package:zot_starter/src/app/themes/foundation/sizes.dart';
import 'package:zot_starter/src/common/components/button.dart';
import 'package:zot_starter/src/features/auth/widget/social_auth_controller.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

class SocialAuthSection extends ConsumerWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          child: Text('Login instantly using your social media'),
        ),
        Gap.h24,
        CommonButton.withIcon(
          'Continue with Google'.hardcoded,
          icon: Assets.icons.googleIcon.svg(),
          onPressed: () =>
              ref.read(socialAuthController.notifier).signInWithGoogle(),
        ),
        Gap.h16,
        CommonButton.withIcon(
          'Continue with Apple'.hardcoded,
          icon: Assets.icons.appleIcon.svg(),
          onPressed: () =>
              ref.read(socialAuthController.notifier).signInWithApple(),
        ),
        Gap.h16,
        CommonButton.withIcon(
          'Continue with Facebook'.hardcoded,
          icon: Assets.icons.facebookIcon.svg(),
          onPressed: () =>
              ref.read(socialAuthController.notifier).signInWithFacebook(),
        ),
        Gap.h16,
      ],
    );
  }
}
