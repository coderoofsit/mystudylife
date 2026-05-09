import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  const baseGreen = Color(0xFF27C863);
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFE8F6EC),
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(
      seedColor: baseGreen,
      brightness: Brightness.light,
    ),
  );
}
