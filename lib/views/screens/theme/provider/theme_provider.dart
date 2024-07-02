import 'package:flutter/material.dart';
import 'package:flutter_template/services/app_pref.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = AppPrefHelper.getTheme();
  ThemeMode get themeMode => _themeMode;

  Future<void> updateTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    await AppPrefHelper.setTheme(themeMode);
    notifyListeners();
  }
}
