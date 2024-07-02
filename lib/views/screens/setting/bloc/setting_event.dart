part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

final class InitSetting extends SettingEvent {}

final class EnableNotification extends SettingEvent {}

final class DisableNotification extends SettingEvent {}
