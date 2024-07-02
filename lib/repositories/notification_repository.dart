import 'package:flutter_template/utility/app_logger.dart';

class NotificationRepository {
  Future<void> enableNotification() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
    } catch (e) {
      AppLogger.error(e.toString());
    }
  }

  Future<void> disableNotification() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
    } catch (e) {
      AppLogger.error(e.toString());
    }
  }
}
