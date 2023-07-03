import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/components/button/zero_button.dart';
import 'package:zot_starter/src/services/auth_service.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ZeroButton.primary(
      child: const Text('Sign Out'),
      onPressed: () {
        ref.read(authServiceProvider).signOut();
      },
    );
  }
}
