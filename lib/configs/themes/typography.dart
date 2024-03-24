import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'sizes.dart';

class AppTypography {
  static double? _convertFigmaLetterSpacingToFlutterValue(double? value) => value != null ? (value / 100) * 16 : null;

  var lightTextTheme = GoogleFonts.interTextTheme().apply(
    bodyColor: AppColors.grayLight.shade900,
    displayColor: AppColors.grayLight.shade900,
    decorationColor: AppColors.grayLight.shade900,
  );

  var darkTextTheme = GoogleFonts.interTextTheme().apply(
    bodyColor: AppColors.grayDark.shade900,
    displayColor: AppColors.grayDark.shade900,
    decorationColor: AppColors.grayDark.shade900,
  );

  static TextStyle headingH1 = AppScreenSizes.when(
    desktop: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 60,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
    table: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 48,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
    mobile: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 36,
    ),
  );

  static TextStyle headingH2 = AppScreenSizes.when(
    desktop: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 36,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
    table: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
  );

  static TextStyle headingH3SemiBold = AppScreenSizes.when(
    desktop: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
    table: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
  );

  static TextStyle headingH3Bold = AppScreenSizes.when(
    desktop: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
    table: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: _convertFigmaLetterSpacingToFlutterValue(-2),
    ),
  );

  static TextStyle subtitleNormal = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
    table: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
  );

  static TextStyle subtitleSemiBold = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    table: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  );

  static TextStyle body1Normal = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    table: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  );

  static TextStyle body2Normal = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  );

  static TextStyle body2Underline = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      decoration: TextDecoration.underline,
    ),
  );

  static TextStyle body2Medium = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
  );

  static TextStyle body2SemiBold = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  );

  static TextStyle body3Normal = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  );

  static TextStyle body3Medium = AppScreenSizes.when(
    desktop: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
  );
}
