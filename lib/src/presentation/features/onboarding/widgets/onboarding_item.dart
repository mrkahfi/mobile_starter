import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

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
      child: PaddingWidget(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            icon ?? Container(),
            Text(
              title,
              style: TypographyTheme.title3.copyWith(color: ColorApp.white),
              textAlign: TextAlign.center,
            ),
            Gap.h16,
            Text(
              content,
              style: TypographyTheme.subtitle1Medium
                  .copyWith(color: ColorApp.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
