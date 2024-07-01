import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/services/app_pref.dart';
import 'package:flutter_template/setup.dart';
import 'package:flutter_template/utility/app_logger.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // Initialize Splash Screen
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      // Initialize Shared Preferences
      await AppPref.init();

      // Initialize AppLogger
      await AppLogger.init();

      // Initialize Dependency Injector
      setup();

      runApp(const MyApp());
    },
    catchUnhandledExceptions,
  );
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  debugPrintStack(stackTrace: stack, label: error.toString());
}
