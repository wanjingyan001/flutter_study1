import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  const Color primaryColor = Color(0xFF0175c2);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ThemeData base = ThemeData.light();
  final ColorScheme scheme = ColorScheme.light()
      .copyWith(primary: primaryColor, secondary: secondaryColor);
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    accentColor: secondaryColor,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
        colorScheme: scheme, textTheme: ButtonTextTheme.primary),
  );
}

ThemeData buildDarkTheme() {
  const Color primaryColor = Color(0xFF0175c2);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ThemeData base = ThemeData.dark();
  final ColorScheme scheme = ColorScheme.dark()
      .copyWith(primary: primaryColor, secondary: secondaryColor);
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    accentColor: secondaryColor,
    scaffoldBackgroundColor: const Color(0xFF202124),
    canvasColor: const Color(0xFF202124),
    backgroundColor: const Color(0xFF202124),
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
        colorScheme: scheme, textTheme: ButtonTextTheme.primary),
  );
}
