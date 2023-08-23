import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_app/gen/assets.gen.dart';
import 'package:just_app/src/app/themes/foundation/sizes.dart';
import 'package:just_app/src/common/components/button.dart';
import 'package:just_app/src/features/auth/social_auth/social_auth_controller.dart';
import 'package:just_app/src/utils/extensions/string_extension.dart';

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
        if (Platform.isIOS) ...[
          Gap.h16,
          CommonButton.withIcon(
            'Continue with Apple'.hardcoded,
            icon: Assets.icons.appleIcon.svg(),
            onPressed: () =>
                ref.read(socialAuthController.notifier).signInWithApple(),
          ),
        ],
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
