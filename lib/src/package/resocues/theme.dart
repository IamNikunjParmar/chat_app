// theme.dart
import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColor.primaryGreen,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColor.lightTextColor),
    bodyLarge: TextStyle(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryGreen,
      foregroundColor: Colors.white,
    ),
  ),
  // shadowColor: Colors.grey.shade700,
);

// dark_theme.dart

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColor.primaryGreen,
  brightness: Brightness.dark, //
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColor.darkTextColor),
    bodyLarge: TextStyle(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryGreen,
      foregroundColor: Colors.white,
    ),
  ),
);
