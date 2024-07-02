import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  AppPref._();

  static SharedPreferences? _pref;

  static Future<void> init() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  static Future<bool> save(AppPrefKey key, dynamic value) async {
    log('PreferenceKey $key, Value: $value, Type: ${value.runtimeType}');

    if (value == null) {
      return false;
    }

    switch (value.runtimeType) {
      case String:
        return _pref!.setString(key.name, value as String);
      case int:
        return _pref!.setInt(key.name, value as int);
      case bool:
        return _pref!.setBool(key.name, value as bool);
      case double:
        return _pref!.setDouble(key.name, value as double);
      case const (List<String>):
        return _pref!.setStringList(key.name, value as List<String>);
    }

    log('PreferenceKey return false');
    return false;
  }

  static dynamic get(AppPrefKey key, dynamic defaultValue) {
    final value = _pref!.get(key.name) ?? defaultValue;
    log('PreferenceKey $key Value: $value');
    return value;
  }

  static Future<bool> remove(AppPrefKey key) async {
    return _pref!.remove(key.name);
  }

  static Future<bool> clear() async {
    return _pref!.clear();
  }
}

enum AppPrefKey {
  language('language'),
  theme('theme'),
  username('username'),
  email('email'),
  uid('logout');

  const AppPrefKey(this.name);
  final String name;
}

class AppPrefHelper {
  static Future<bool> setUID({required String uid}) async {
    return AppPref.save(AppPrefKey.uid, uid);
  }

  static String getUID() {
    final uid = AppPref.get(AppPrefKey.uid, '') as String;
    log('uid: $uid');
    return uid;
  }

  static Future<bool> setUsername({required String username}) async {
    return AppPref.save(AppPrefKey.username, username);
  }

  static String getUsername() {
    final username = AppPref.get(AppPrefKey.username, '') as String;
    log('username: $username');
    return username;
  }

  static Future<bool> setEmail({required String email}) async {
    return AppPref.save(AppPrefKey.email, email);
  }

  static String getEmail() {
    final email = AppPref.get(AppPrefKey.email, '') as String;
    log('email: $email');
    return email;
  }

  static Future<bool> saveLanguage(String languageCode) async {
    return AppPref.save(AppPrefKey.language, languageCode);
  }

  static String getLanguage() {
    final language = AppPref.get(AppPrefKey.language, 'en') as String;
    log('language: $language');
    return language;
  }

  static Future<bool> setTheme(ThemeMode themeMode) async {
    return AppPref.save(AppPrefKey.theme, getThemeCode(themeMode));
  }

  static ThemeMode getTheme() {
    final themeCode =
        AppPref.get(AppPrefKey.theme, getThemeCode(ThemeMode.system)) as int;
    log('theme: ${getThemeMode(themeCode)}');
    return getThemeMode(themeCode);
  }

  static Future<void> signOut() async {
    await AppPref.remove(AppPrefKey.uid);
    await AppPref.remove(AppPrefKey.username);
    await AppPref.remove(AppPrefKey.email);
  }
}

int getThemeCode(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.system:
      return 0;
    case ThemeMode.light:
      return 1;
    case ThemeMode.dark:
      return -1;
  }
}

ThemeMode getThemeMode(int code) {
  switch (code) {
    case 0:
      return ThemeMode.system;
    case 1:
      return ThemeMode.light;
    default:
      return ThemeMode.dark;
  }
}
