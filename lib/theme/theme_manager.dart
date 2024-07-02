import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_scheme.dart';
part 'extensions.dart';

ThemeData appTheme(
  BuildContext context, {
  required ColorScheme colorScheme,
  required SystemUiOverlayStyle systemUiOverlayStyle,
}) {
  final baseTheme = ThemeData(brightness: colorScheme.brightness);
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
  ).copyWith(
    textTheme: GoogleFonts.robotoSlabTextTheme(baseTheme.textTheme),
    appBarTheme: _appBarTheme(systemUiOverlayStyle),
  );
}

AppBarTheme _appBarTheme(SystemUiOverlayStyle systemUiOverlayStyle) {
  return AppBarTheme(
    scrolledUnderElevation: 0,
    elevation: 0,
    systemOverlayStyle: systemUiOverlayStyle,
  );
}
