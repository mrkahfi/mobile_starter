import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// [TutorialVideoScreen] is a screen for TutorialVideo
class TutorialVideoScreen extends ConsumerWidget {
  /// Create [TutorialVideoScreen] object with a key
  const TutorialVideoScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ZeroAppBar(
          title: const Text('TutorialVideo'),
        ),
        body: const Placeholder(),
      );
  }
}
