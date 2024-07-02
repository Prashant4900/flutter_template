import 'package:flutter_template/repositories/auth_repository.dart';
import 'package:flutter_template/repositories/notification_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton<NotificationRepository>(NotificationRepository())
    ..registerSingleton<AuthRepository>(AuthRepository());
}
