import 'package:flutter/material.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/common/components/button.dart';
import 'package:zot_starter/src/routing/routes.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Gap.h32,
            CommonButton(
              onPressed: () => context.goNamed(Routes.main.name),
              'Go Home'.hardcoded,
            )
          ],
        ),
      ),
    );
  }
}
