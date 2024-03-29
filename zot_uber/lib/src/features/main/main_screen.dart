import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_uber/src/features/main/main_controller.dart';
import 'package:zot_uber/src/routing/routes.dart';
import 'package:zot_uber/src/utils/extensions/build_context_extension/text_styles.dart';
import 'package:zot_uber/src/utils/extensions/build_context_extension/theme_extension.dart';

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
            ref.read(appControllerProvider.notifier).toggleThemeMode(),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: context.theme.colorScheme.background,
        selectedItemColor: context.theme.colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        items: MainTabRoute.values
            .map(
              (e) => BottomNavigationBarItem(
                icon: e.icon,
                label: e.label,
              ),
            )
            .toList(),
        currentIndex: MainTabRoute.values.indexWhere((element) {
          log(' ${element.path} == $location');
          return element.path == location;
        }),
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
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: content ??
            Text(
              title,
              style: context.titleTextStyle,
            ),
      ),
    );
  }
}
