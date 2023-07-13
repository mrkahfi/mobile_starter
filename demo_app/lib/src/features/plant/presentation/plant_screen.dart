import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// [PlantScreen] is a screen for Plant
class PlantScreen extends ConsumerWidget {
  /// Create [PlantScreen] object with a key
  const PlantScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ZeroAppBar(
          title: const Text('Plant'),
        ),
        body: const Placeholder(),
      );
  }
}
