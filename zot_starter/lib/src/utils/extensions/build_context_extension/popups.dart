import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) =>
      showModalBottomSheet(
        context: this,
        barrierColor: barrierColor,
        isScrollControlled: isScrollControlled,
        backgroundColor: backgroundColor,
        builder: (context) => Wrap(children: [child]),
      );

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message,
  ) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );

  Future<bool?> showToast(String message) async => true;
}
