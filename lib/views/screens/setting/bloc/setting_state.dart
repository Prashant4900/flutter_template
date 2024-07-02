part of 'setting_bloc.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class SettingLoading extends SettingState {}

final class SettingError extends SettingState {
  const SettingError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class SettingSuccess extends SettingState {
  const SettingSuccess({
    this.notificationStatus = false,
  });

  final bool notificationStatus;

  @override
  List<Object> get props => [notificationStatus];
}
