import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// [UserLocationScreen] is a screen for UserLocation
class UserLocationScreen extends ConsumerWidget {
  /// Create [UserLocationScreen] object with a key
  const UserLocationScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ZeroAppBar(
          title: const Text('UserLocation'),
        ),
        body: const Placeholder(),
      );
  }
}
