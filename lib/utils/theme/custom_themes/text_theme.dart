import "package:flutter/material.dart";

import "../../constants/colors.dart";

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: PColors.dark,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: PColors.dark,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: PColors.dark,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: PColors.dark,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: PColors.dark,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: PColors.dark,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: PColors.dark,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: PColors.dark,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      color: PColors.dark.withValues(alpha: 0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: PColors.dark,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: PColors.dark.withValues(alpha: 0.5),
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: PColors.light,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: PColors.light,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: PColors.light,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: PColors.light,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: PColors.light,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: PColors.light,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: PColors.light,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: PColors.light,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      color: PColors.light.withValues(alpha: 0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: PColors.light,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: PColors.light.withValues(alpha: 0.5),
    ),
  );
}
