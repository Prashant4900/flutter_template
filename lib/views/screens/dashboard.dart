import 'package:flutter/material.dart';
import 'package:flutter_template/common/extensions.dart';
import 'package:flutter_template/views/screens/home/home_screen.dart';
import 'package:flutter_template/views/screens/setting/setting_screen.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  final _screen = [const MyHomeScreen(), const MySettingScreen()];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen.elementAt(_currentIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard),
            label: context.lang.home,
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
