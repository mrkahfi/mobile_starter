import 'package:demo_app/src/app/themes/foundation/sizes.dart';
import 'package:demo_app/src/utils/extensions/theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePageItem extends StatelessWidget {
  const WelcomePageItem({
    required this.title,
    required this.content,
    super.key,
    this.icon,
  });

  final String title;
  final String content;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.theme.colorScheme.primary,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          icon ?? Container(),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          Gap.h16,
          Text(
            content,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
