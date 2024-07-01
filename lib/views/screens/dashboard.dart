import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:go_router/go_router.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({required this.child, super.key});

  final Widget child;

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  final _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndexNotifier.value,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go(MyRoutes.home);
            case 1:
              context.go(MyRoutes.settingScreen);
            case 2:
              context.go(MyRoutes.settingScreen);
            case 3:
              context.go(MyRoutes.settingScreen);
          }
          _currentIndexNotifier.value = index;
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            label: context.lang.home,
          ),
          const NavigationDestination(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Friends',
          ),
          const NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytic',
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            label: context.lang.settings,
          ),
        ],
      ),
    );
  }
}
