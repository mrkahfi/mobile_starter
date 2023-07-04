import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:zot_starter/src/app/themes/constants/themes.dart';
import 'package:zot_starter/src/features/splash/splash_controller.dart';
import 'package:zot_starter/src/routing/routes.dart';
import 'package:zot_starter/src/utils/extensions/build_context_extension/theme_colors.dart';

/// Screen that contains the bottom navigation bar along with the children tabs
class SplashScreen extends ConsumerWidget {
  /// Create [SplashScreen] object with a key
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenController(context, ref);

    return Scaffold(
      body: Scaffold(
        backgroundColor: context.theme.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: context.onPrimary),
              Gap.h16,
              Text(
                'Splash Screen',
                style: TextStyle(color: context.onPrimary),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _listenController(BuildContext context, WidgetRef ref) {
    ref.listen(splashControllerProvider, (previous, next) {
      if (!next.isLoading) {
        context.goNamed(Routes.main.name);
      }
    });
  }
}
