import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// [BlogScreen] is a screen for Blog
class BlogScreen extends ConsumerWidget {
  /// Create [BlogScreen] object with a key
  const BlogScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ZeroAppBar(
          title: const Text('Blog'),
        ),
        body: const Placeholder(),
      );
  }
}
