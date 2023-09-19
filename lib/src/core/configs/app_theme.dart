import 'package:exercise_project/src/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static getAppTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: kPrimaryColor,
      ),
      useMaterial3: true,
    );
  }
}
