import 'package:demo_app/src/features/auth/logout/logout_controller.dart';
import 'package:demo_app/src/routing/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/components/button/zero_button.dart';

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
    return ZeroButton.primary(
      child: const Text('Sign Out'),
      onPressed: () => ref.read(logoutControllerProvider.notifier).logout(),
    );
  }
}
