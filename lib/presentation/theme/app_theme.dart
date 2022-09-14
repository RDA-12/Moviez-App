import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static final lightColor = LightColor();
  static final darkColor = DarkColor();

  static ColorScheme light = ColorScheme.light(
    background: lightColor.background,
    onBackground: lightColor.onBackground,
    primary: lightColor.primary,
    primaryContainer: lightColor.primaryContainer,
    onPrimary: lightColor.onPrimary,
    secondary: lightColor.secondary,
    secondaryContainer: lightColor.secondaryContainer,
    onSecondary: lightColor.onSecondary,
    surface: lightColor.surface,
    onSurface: lightColor.onSurface,
    error: lightColor.error,
    onError: lightColor.onError,
    brightness: lightColor.brightness,
  );
  static ColorScheme dark = const ColorScheme.dark().copyWith(
    background: darkColor.background,
    onBackground: darkColor.onBackground,
    primary: darkColor.primary,
    primaryContainer: darkColor.primaryContainer,
    onPrimary: darkColor.onPrimary,
    secondary: darkColor.secondary,
    secondaryContainer: darkColor.secondaryContainer,
    onSecondary: darkColor.onSecondary,
    surface: darkColor.surface,
    onSurface: darkColor.onSurface,
    error: darkColor.error,
    onError: darkColor.onError,
    brightness: darkColor.brightness,
  );

  static ThemeData theme({required bool isDark}) {
    return ThemeData(
      colorScheme: isDark ? dark : light,
      textTheme: GoogleFonts.lilitaOneTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
