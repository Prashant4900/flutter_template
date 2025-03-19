import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/extensions.dart';
import 'package:flutter_template/views/screens/setting/cubit/setting_cubit.dart';

class MyLanguageScreen extends StatelessWidget {
  const MyLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(context.lang.displayLanguage)),
          body: Column(
            children: [
              ListTile(
                title: const Text('English'),
                subtitle: const Text('English'),
                trailing: state.locale == 'en' ? const Icon(Icons.check) : null,
                onTap:
                    () async =>
                        context.read<SettingCubit>().updateLanguage('en'),
              ),
              ListTile(
                title: const Text('हिन्दी'),
                subtitle: const Text('Hindi'),
                trailing: state.locale == 'hi' ? const Icon(Icons.check) : null,
                onTap:
                    () async =>
                        context.read<SettingCubit>().updateLanguage('hi'),
              ),
              ListTile(
                title: const Text('Español'),
                subtitle: const Text('Spanish'),
                trailing: state.locale == 'es' ? const Icon(Icons.check) : null,
                onTap:
                    () async =>
                        context.read<SettingCubit>().updateLanguage('es'),
              ),
            ],
          ),
        );
      },
    );
  }
}
