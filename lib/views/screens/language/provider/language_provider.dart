import 'package:flutter/material.dart';
import 'package:flutter_template/services/app_pref.dart';

class LanguageProvider extends ChangeNotifier {
  String _language = AppPrefHelper.getLanguage();
  String get language => _language;

  Future<void> updateLanguage(String value) async {
    await AppPrefHelper.saveLanguage(value);
    _language = value;
    notifyListeners();
  }
}
