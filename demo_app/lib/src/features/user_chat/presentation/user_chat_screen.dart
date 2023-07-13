import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// [UserChatScreen] is a screen for UserChat
class UserChatScreen extends ConsumerWidget {
  /// Create [UserChatScreen] object with a key
  const UserChatScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ZeroAppBar(
          title: const Text('UserChat'),
        ),
        body: const Placeholder(),
      );
  }
}
