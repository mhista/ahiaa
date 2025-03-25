import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: PColors.darkGrey,
    suffixIconColor: PColors.darkGrey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: PColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: PColors.black),
    errorStyle: const TextStyle().copyWith(fontSize: 10, color: PColors.black),
    floatingLabelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: PColors.black.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 1,
        color: PColors.dark.withValues(alpha: 0.6),
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 1,
        color: PColors.dark.withValues(alpha: 0.6),
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 1,
        color: PColors.dark.withValues(alpha: 0.8),
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1, color: PColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1, color: PColors.warning),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: PColors.grey,
    suffixIconColor: PColors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: PColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: PColors.white),
    errorStyle: const TextStyle().copyWith(
      fontSize: 10,
      color: PColors.white.withValues(alpha: 0.8),
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: PColors.white,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1, color: PColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1, color: PColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1, color: PColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1, color: PColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1, color: PColors.warning),
    ),
  );
}
