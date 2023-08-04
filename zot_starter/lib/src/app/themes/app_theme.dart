import 'package:flutter/material.dart';
import 'package:zot_starter/gen/fonts.gen.dart';
import 'package:zot_starter/src/app/themes/foundation/colors.dart';
import 'package:zot_starter/src/app/themes/foundation/typography.dart';

class AppTheme {
  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: LightColors.primaryColor,
    onPrimary: LightColors.primaryColor[9] ?? LightColors.primaryColor,
    surface: LightColors.neutralColor[0] ?? LightColors.neutralColor,
    onBackground: LightColors.neutralColor[9] ?? LightColors.neutralColor,
    error: LightColors.errorColor,
    // define more colors
  );

  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: DarkColors.primaryColor,
    onPrimary: DarkColors.primaryColor[9] ?? DarkColors.primaryColor,
    surface: DarkColors.neutralColor[0] ?? DarkColors.neutralColor,
    onSurface: DarkColors.neutralColor[9] ?? DarkColors.neutralColor,
    error: DarkColors.errorColor,
    // define more colors
  );

  static TextTheme lightTypography = AppTypography(
    colorScheme: lightColorScheme,
    primaryFont: FontFamily.dMSans,
    secondaryFont: FontFamily.dMMono,
    // TODO: define your fonts
  ).toTextTheme();

  static TextTheme darkTypography = AppTypography(
    colorScheme: darkColorScheme,
    primaryFont: FontFamily.dMSans,
    secondaryFont: FontFamily.dMMono,
    // TODO: define your fonts
  ).toTextTheme();

  static final ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    primaryColor: LightColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.background,
      elevation: 0,
      titleTextStyle: lightTypography.labelSmall,
    ),
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: LightColors.errorColor),
      ),
      errorStyle:
          lightTypography.labelSmall?.copyWith(color: LightColors.errorColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightColors.primaryColor,
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppColors(
        buttonTextColor: LightColors.neutralColor[9],
        warningColor: LightColors.warningColor,
      ),
      // more themeextensions here
    ],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => const Size(100, 42),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(),
    textTheme: lightTypography,
    // more theme data here
  );

  static final ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    primaryColor: DarkColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.background,
      elevation: 0,
      titleTextStyle: darkTypography.titleSmall,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: DarkColors.errorColor),
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppColors(
        buttonTextColor: LightColors.neutralColor[9],
        warningColor: DarkColors.warningColor,
      ),
    ],
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: DarkColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => const Size(100, 42),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(),
    textTheme: darkTypography,
    // more theme data here
  );
}

extension ThemeExtended on TextTheme {
  TextStyle get buttonText =>
      labelLarge!.copyWith(color: LightColors.neutralColor[9]);
}
