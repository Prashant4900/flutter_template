import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:flutter_template/views/screens/theme/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyThemeScreen extends StatelessWidget {
  const MyThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, value, _) {
          return Scaffold(
            appBar: headerNav(
              context,
              title: context.lang.selectTheme,
            ),
            body: Column(
              children: [
                ListTile(
                  title: Text(
                    context.lang.light,
                    style: context.bodyLarge,
                  ),
                  trailing: value.themeMode == ThemeMode.light
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () async => context
                      .read<ThemeProvider>()
                      .updateTheme(ThemeMode.light),
                ),
                ListTile(
                  title: Text(
                    context.lang.dark,
                    style: context.bodyLarge,
                  ),
                  trailing: value.themeMode == ThemeMode.dark
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () async =>
                      context.read<ThemeProvider>().updateTheme(ThemeMode.dark),
                ),
                ListTile(
                  title: Text(
                    context.lang.system,
                    style: context.bodyLarge,
                  ),
                  trailing: value.themeMode == ThemeMode.system
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () async => context
                      .read<ThemeProvider>()
                      .updateTheme(ThemeMode.system),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
