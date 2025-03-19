import 'package:flutter/material.dart' show BuildContext, Color;
import 'package:flutter_template/gen/l10n/app_localizations.dart';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension ColorExtension on int {
  Color toARGB32() {
    return Color(this);
  }
}

extension LocalizationStrings on BuildContext {
  AppLocalizations get lang {
    return AppLocalizations.of(this)!;
  }
}
