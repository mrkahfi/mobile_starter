import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/presentation/features/splash/splash_controller.dart';
import 'package:zot_starter/src/routes/routes.dart';

/// Screen that contains the bottom navigation bar along with the children tabs
class SplashScreen extends ConsumerWidget {
  /// Create [SplashScreen] object with a key
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashControllerProvider, (previous, next) {
      if (!next.isLoading) {
        context.goNamed(Routes.main.name);
      }
    });
    return const Scaffold(
      body: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
