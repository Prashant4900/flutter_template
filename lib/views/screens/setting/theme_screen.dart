import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/extensions.dart';
import 'package:flutter_template/views/screens/setting/cubit/setting_cubit.dart';

class MyThemeScreen extends StatelessWidget {
  const MyThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(context.lang.themeMode)),
          body: Column(
            children: [
              ListTile(
                title: Text(context.lang.systemDefault),
                subtitle: Text(context.lang.systemDefaultSubTitle),
                leading: const Icon(Icons.contrast_outlined),
                trailing:
                    state.themeMode == ThemeMode.system
                        ? const Icon(Icons.check)
                        : null,
                onTap:
                    () async => context.read<SettingCubit>().updateThemeMode(
                      ThemeMode.system,
                    ),
              ),
              ListTile(
                title: Text(context.lang.light),
                subtitle: Text(context.lang.lightSubTitle),
                leading: const Icon(Icons.light_mode_outlined),
                trailing:
                    state.themeMode == ThemeMode.light
                        ? const Icon(Icons.check)
                        : null,
                onTap:
                    () async => context.read<SettingCubit>().updateThemeMode(
                      ThemeMode.light,
                    ),
              ),
              ListTile(
                title: Text(context.lang.dark),
                subtitle: Text(context.lang.darkSubTitle),
                leading: const Icon(Icons.dark_mode_outlined),
                trailing:
                    state.themeMode == ThemeMode.dark
                        ? const Icon(Icons.check)
                        : null,
                onTap:
                    () async => context.read<SettingCubit>().updateThemeMode(
                      ThemeMode.dark,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
