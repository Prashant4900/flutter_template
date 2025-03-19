import 'package:flutter/material.dart';
import 'package:flutter_template/common/extensions.dart';
import 'package:flutter_template/utils/app_prefs.dart';

List<Color> colorPalette = [
  const Color(0xFFA0C878),
  const Color(0xFFA1E3F9),
  const Color(0xFFBF3131),
  const Color(0xFF693382),
  const Color(0xFFFFB200),
  const Color(0xFF336D82),
  const Color(0xFFEC7FA9),
  const Color(0xFF205781),
  const Color(0xFF98D8EF),
  const Color(0xFFFBF3B9),
];

abstract class ThemeManager {
  static final Color _seedColor =
      AppPrefHelper.getIsDynamicColor()
          ? (AppPrefHelper.getDynamicColor() == 0
              ? colorPalette[0]
              : AppPrefHelper.getDynamicColor().toARGB32())
          : Colors.purple;

  static ThemeData get lightTheme =>
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seedColor));

  static ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: _seedColor,
    ),
  );
}
