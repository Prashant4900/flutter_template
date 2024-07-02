import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/views/screens/account/account_details_screen.dart';
import 'package:flutter_template/views/screens/auth/forgot_password_screen.dart';
import 'package:flutter_template/views/screens/auth/login_screen.dart';
import 'package:flutter_template/views/screens/auth/otp_screen.dart';
import 'package:flutter_template/views/screens/auth/phone_screen.dart';
import 'package:flutter_template/views/screens/auth/signup_screen.dart';
import 'package:flutter_template/views/screens/dashboard.dart';
import 'package:flutter_template/views/screens/home/home_screen.dart';
import 'package:flutter_template/views/screens/language/language_screen.dart';
import 'package:flutter_template/views/screens/notification/notifications_screen.dart';
import 'package:flutter_template/views/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_template/views/screens/setting/setting_page.dart';
import 'package:flutter_template/views/screens/theme/theme_screen.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MyRoutes {
  static const home = '/';
  static const settingScreen = '/setting';
  static const onboardingScreen = '/onboarding';
  static const logInScreen = '/login';
  static const signUpScreen = '/signUp';
  static const phoneScreen = '/phone';
  static const otpScreen = '/otp';
  static const forgotPasswordScreen = '/forgotPassword';
  static const languageScreen = '/language';
  static const notificationScreen = '/notification';
  static const themeScreen = '/theme';
  static const accountDetailScreen = '/accountDetail';
}

final routerConfig = GoRouter(
  initialLocation: MyRoutes.languageScreen,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.onboardingScreen,
      builder: (context, state) => const MyOnboardingScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.phoneScreen,
      builder: (context, state) => const MyPhoneScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.otpScreen,
      builder: (context, state) => const MyOtpScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.logInScreen,
      builder: (context, state) => const MyLoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.signUpScreen,
      builder: (context, state) => const MySignUpScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.forgotPasswordScreen,
      builder: (context, state) => const MyForgotPasswordScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.languageScreen,
      builder: (context, state) => const MyLanguageScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.notificationScreen,
      builder: (context, state) => const MyNotificationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.themeScreen,
      builder: (context, state) => const MyThemeScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: MyRoutes.accountDetailScreen,
      builder: (context, state) => const MyAccountDetailScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MyDashboard(child: child),
      routes: [
        GoRoute(
          path: MyRoutes.home,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MyHomePage()),
        ),
        GoRoute(
          path: MyRoutes.settingScreen,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MySettingPage()),
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    return null;
  },
);
