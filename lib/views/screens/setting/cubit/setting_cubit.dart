import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/extensions.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/utils/app_prefs.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  Future<void> init() async {
    final isDynamicColor = AppPrefHelper.getIsDynamicColor();
    final dynamicColor = AppPrefHelper.getDynamicColor();
    final themeMode = AppPrefHelper.getThemeMode();
    final local = AppPrefHelper.getLanguage();

    emit(
      state.copyWith(
        isDynamicColor: isDynamicColor,
        dynamicColor: dynamicColor.toARGB32(),
        themeMode: themeMode,
        locale: local,
      ),
    );
  }

  Future<void> toggleDynamicColor({required bool isDyanmicColor}) async {
    await AppPrefHelper.setIsDynamicColor(isDynamicColor: isDyanmicColor);
    emit(state.copyWith(isDynamicColor: isDyanmicColor));
  }

  Future<void> updateDyanmicColor(Color color) async {
    await AppPrefHelper.setDynamicColor(dynamicColor: color.toARGB32());
    emit(state.copyWith(dynamicColor: color));
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await AppPrefHelper.saveThemeMode(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> updateLanguage(String local) async {
    await AppPrefHelper.saveLanguage(local);
    emit(state.copyWith(locale: local));
  }
}
