import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/repositories/notification_repository.dart';
import 'package:flutter_template/setup.dart';
import 'package:flutter_template/utility/app_logger.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<InitSetting>(_initSetting);
    on<EnableNotification>(_enableNotification);
    on<DisableNotification>(_disableNotification);
  }

  final notificationRepo = getIt<NotificationRepository>();

  FutureOr<void> _enableNotification(
    EnableNotification event,
    Emitter<SettingState> emit,
  ) async {
    try {
      await notificationRepo.enableNotification();
    } catch (e) {
      AppLogger.error(e.toString());
      emit(SettingError(message: e.toString()));
    }
  }

  FutureOr<void> _disableNotification(
    DisableNotification event,
    Emitter<SettingState> emit,
  ) async {
    try {
      await notificationRepo.disableNotification();
    } catch (e) {
      AppLogger.error(e.toString());
      emit(SettingError(message: e.toString()));
    }
  }

  FutureOr<void> _initSetting(
    InitSetting event,
    Emitter<SettingState> emit,
  ) async {
    emit(SettingLoading());
    try {
      emit(const SettingSuccess());
    } catch (e) {
      AppLogger.error(e.toString());
      emit(SettingError(message: e.toString()));
    }
  }
}
