import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_template/gen/l10n/app_localizations.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/screens/language/provider/language_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Remove Splash Screen
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, value, child) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: appTheme(
              context,
              colorScheme: lightColorScheme,
              systemUiOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            darkTheme: appTheme(
              context,
              colorScheme: darkColorScheme,
              systemUiOverlayStyle: SystemUiOverlayStyle.light,
            ),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            routerConfig: routerConfig,
            locale: Locale(context.read<LanguageProvider>().language),
            supportedLocales: [
              Locale(AppLocale.arabic.code),
              Locale(AppLocale.english.code),
              Locale(AppLocale.hindi.code),
              Locale(AppLocale.spanish.code),
              Locale(AppLocale.russian.code),
              Locale(AppLocale.japanese.code),
              Locale(AppLocale.korean.code),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
