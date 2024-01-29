import 'package:flutter/material.dart';
import 'package:pet_finder/core/design/tokens/palette.dart';
import 'package:pet_finder/core/design/tokens/styles.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: Palette.primary,
    scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
    dialogBackgroundColor: Palette.dialogBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.scaffoldBackgroundColor,
      foregroundColor: Palette.black,
      elevation: 0,
      titleTextStyle: AppTextStyle.regularBody1,
    ),
    colorScheme: const ColorScheme.light(
      primary: Palette.primary,
      secondary: Palette.white,
      tertiary: Palette.black,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Palette.white,
      surfaceTintColor: Palette.white,
      shadowColor: Palette.white,
    ),
    hintColor: Palette.hintColor,
    focusColor: Palette.focusColor,
    textTheme: const TextTheme(
      bodyLarge: AppTextStyle.regularBody1,
      bodyMedium: AppTextStyle.regularBody2,
      bodySmall: AppTextStyle.regularBody3,
      displayLarge: AppTextStyle.mobileHeading1,
      displayMedium: AppTextStyle.mobileHeading2,
      displaySmall: AppTextStyle.mobileHeading3,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Palette.primaryDark,
    scaffoldBackgroundColor: Palette.neutral800,
    dialogBackgroundColor: Palette.dialogBackgroundColorDark,
    colorScheme: const ColorScheme.dark(
      primary: Palette.primaryDark,
      secondary: Palette.black,
      tertiary: Palette.white,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Palette.white,
      surfaceTintColor: Palette.white,
      shadowColor: Palette.white,
    ),
    hintColor: Palette.hintColorDark,
    focusColor: Palette.focusColorDark,
    textTheme: const TextTheme(
      bodyLarge: AppTextStyle.regularBody1,
      bodyMedium: AppTextStyle.regularBody2,
      bodySmall: AppTextStyle.regularBody3,
      displayLarge: AppTextStyle.mobileHeading1,
      displayMedium: AppTextStyle.mobileHeading2,
      displaySmall: AppTextStyle.mobileHeading3,
    ),
  );
}
