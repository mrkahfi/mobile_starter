import 'package:demo_app/src/features/main/main_controller.dart';
import 'package:demo_app/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// Screen that contains the bottom navigation bar along with the children tabs
class MainScreen extends ConsumerWidget {
  /// Create [MainScreen] object with a key
  const MainScreen({
    required this.child,
    required this.location,
    super.key,
  });

  /// Route for every child for bottomNavigationBar
  final String location;

  /// Represents tabs for bottomNavigationBar
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.dark_mode),
        onPressed: () =>
            ref.read(mainControllerProvider.notifier).toggleThemeMode(),
      ),
      body: child,
      bottomNavigationBar: ZeroNavigationBar(
        items: MainTabRoute.values
            .map(
              (e) => ZeroNavigationBarItem(
                icon: e.icon,
                label: e.label,
              ),
            )
            .toList(),
        activeIndex: MainTabRoute.values
            .indexWhere((element) => element.path == location),
        onTap: (index) => context.go(MainTabRoute.values[index].path),
      ),
    );
  }
}

class ContentScreen extends ConsumerWidget {
  const ContentScreen({
    required this.title,
    this.content,
    super.key,
  });
  final String title;
  final Widget? content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: Text(title),
      ),
      body: Center(child: content ?? ZeroText.body1(title)),
    );
  }
}
