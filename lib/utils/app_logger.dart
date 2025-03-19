import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  // AppLogger Initialize
  static Future<void> init() async {
    try {
      if (kDebugMode) {
        log('AppLogger Initialize');
      } else {
        // App Logger Cloud Initialize
      }
    } catch (exception, stackTrace) {
      log(exception.toString(), stackTrace: stackTrace);
    }
  }

  static void info(Object message, {String name = ''}) {
    if (kDebugMode) {
      log('$message', time: DateTime.now(), name: name);
    } else {
      // Sync Logs with cloud
    }
  }

  static void error(
    dynamic exception,
    StackTrace stackTrace, {
    String name = '',
  }) {
    if (kDebugMode) {
      log(
        exception.toString(),
        stackTrace: stackTrace,
        time: DateTime.now(),
        name: name,
      );
    } else {
      // Sync Logs with cloud
    }
  }
}
