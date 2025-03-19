import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/extensions.dart';
import 'package:flutter_template/gen/l10n/app_localizations.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/utils/app_logger.dart';
import 'package:flutter_template/utils/app_prefs.dart';
import 'package:flutter_template/views/screens/dashboard.dart';
import 'package:flutter_template/views/screens/setting/cubit/setting_cubit.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // Initialize Splash Screen
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Initialize ScreenUtil
    await ScreenUtil.ensureScreenSize();

    // Initialize Shared Preferences
    await AppPref.init();

    // Initialize AppLogger
    await AppLogger.init();

    runApp(const MyApp());
  }, catchUnhandledExceptions);
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  debugPrintStack(stackTrace: stack, label: error.toString());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..init(),
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(402, 874),
            minTextAdapt: true,
            ensureScreenSize: true,
            useInheritedMediaQuery: true,
            builder: (context, _) {
              final seedColor =
                  AppPrefHelper.getIsDynamicColor()
                      ? (AppPrefHelper.getDynamicColor() == 0
                          ? colorPalette[0]
                          : AppPrefHelper.getDynamicColor().toARGB32())
                      : Colors.purple;

              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                locale: Locale(state.locale),
                supportedLocales: const [
                  Locale('en'),
                  Locale('hi'),
                  Locale('es'),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
                ),
                darkTheme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    brightness: Brightness.dark,
                    seedColor: seedColor,
                  ),
                ),
                themeMode: state.themeMode,
                home: const MyDashboard(),
              );
            },
          );
        },
      ),
    );
  }
}
