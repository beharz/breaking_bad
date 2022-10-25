import 'package:breaking_bad/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: whiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      color: whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      color: whiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: whiteColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: whiteColor,
      fontSize: 12,
    ),
  ),
);
