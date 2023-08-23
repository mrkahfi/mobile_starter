import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_app/src/common/components/components.dart';
import 'package:just_app/src/features/auth/logout/logout_controller.dart';
import 'package:just_app/src/routing/routes.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(logoutControllerProvider, (_, logout) {
      final loggedOut = logout.isSuccessful.value ?? false;

      if (loggedOut) {
        context.goNamed(Routes.login.name);
      }
    });
    return CommonButton(
      'Sign Out',
      onPressed: () => ref.read(logoutControllerProvider.notifier).logout(),
    );
  }
}
