import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// [IkanScreen] is a screen for Ikan
class IkanScreen extends ConsumerWidget {
  /// Create [IkanScreen] object with a key
  const IkanScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ZeroAppBar(
          title: const Text('Ikan'),
        ),
        body: const Placeholder(),
      );
  }
}
