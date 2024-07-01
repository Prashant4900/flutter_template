import 'package:flutter/material.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/navbar.dart';

class MyThemeScreen extends StatelessWidget {
  const MyThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: 'Select Theme',
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Light',
              style: context.bodyLarge,
            ),
            trailing: const Icon(Icons.check),
          ),
          ListTile(
            title: Text(
              'Dark',
              style: context.bodyLarge,
            ),
          ),
          ListTile(
            title: Text(
              'System',
              style: context.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
