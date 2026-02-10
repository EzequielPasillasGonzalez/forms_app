import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Colors.deepPurple;

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      listTileTheme: const ListTileThemeData(iconColor: seedColor),
    );
  }
}
