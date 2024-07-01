import 'package:flutter/material.dart';
import 'package:flutter_template/gen/l10n/app_localizations.dart';

enum AppLocale {
  english('en'),
  hindi('hi'),
  spanish('es'),
  arabic('ar'),
  russian('ru'),
  japanese('ja'),
  korean('ko');

  const AppLocale(this.code);
  final String code;
}

extension LocalizationStrings on BuildContext {
  AppLocalizations get lang {
    return AppLocalizations.of(this)!;
  }
}
