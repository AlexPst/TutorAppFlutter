import 'package:flutter/material.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';

abstract final class AppTheme {
  static const _seed = Color(0xFF3F51B5);

  static ThemeData get light => _build(Brightness.light, FinanceColors.light);

  static ThemeData get dark => _build(Brightness.dark, FinanceColors.dark);

  static ThemeData _build(Brightness brightness, FinanceColors finance) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: colorScheme,
      extensions: [finance],
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      cardTheme: const CardThemeData(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
