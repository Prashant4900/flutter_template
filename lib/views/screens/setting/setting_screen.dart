import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/dimensions.dart';
import 'package:flutter_template/common/extensions.dart';
import 'package:flutter_template/common/urls.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/utils/url_utility.dart';
import 'package:flutter_template/views/screens/setting/cubit/setting_cubit.dart';
import 'package:flutter_template/views/screens/setting/language_screen.dart';
import 'package:flutter_template/views/screens/setting/theme_screen.dart';

class MySettingScreen extends StatelessWidget {
  const MySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(context.lang.settingScreen)),
          body: ListView(
            children: [
              verticalMargin16,
              Padding(
                padding: horizontalPadding16,
                child: Text(context.lang.appearance),
              ),
              ListTile(
                title: Text(context.lang.dynamicColor),
                subtitle: Text(context.lang.dynamicColorSubTitle),
                leading: const Icon(Icons.color_lens_outlined),
                trailing: Switch(
                  value: state.isDynamicColor,
                  onChanged:
                      (value) async =>
                          context.read<SettingCubit>().toggleDynamicColor(
                            isDyanmicColor: !state.isDynamicColor,
                          ),
                ),
              ),
              if (state.isDynamicColor)
                Column(
                  children: [
                    verticalMargin12,
                    SizedBox(
                      height: 70,
                      child: ListView.separated(
                        itemCount: colorPalette.length,
                        shrinkWrap: true,
                        padding: leftPadding16,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => horizontalMargin8,
                        itemBuilder: (context, index) {
                          final dynamicColor = colorPalette[index];
                          return Container(
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: .3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap:
                                  () async => context
                                      .read<SettingCubit>()
                                      .updateDyanmicColor(dynamicColor),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: dynamicColor,
                                  child:
                                      state.dynamicColor == dynamicColor
                                          ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                          : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    verticalMargin12,
                  ],
                )
              else
                emptyWidget,
              ListTile(
                title: Text(context.lang.selectTheme),
                subtitle: Text(getThemeSubtitle(state.themeMode, context)),
                leading: const Icon(Icons.light_mode_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const MyThemeScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(context.lang.selectLanguage),
                subtitle: Text(getLanguageName(state.locale)),
                leading: const Icon(Icons.language),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const MyLanguageScreen(),
                    ),
                  );
                },
              ),
              verticalMargin16,
              Padding(
                padding: horizontalPadding16,
                child: Text(context.lang.about),
              ),
              ListTile(
                title: Text(context.lang.privacyPolicy),
                leading: const Icon(Icons.privacy_tip_outlined),
                onTap: () async => UrlUtility.launch(privacyPolicyUrl),
              ),
              ListTile(
                title: Text(context.lang.termsOfService),
                leading: const Icon(Icons.description_outlined),
                onTap: () async => UrlUtility.launch(termsAndConditionsUrl),
              ),
              ListTile(
                title: Text(context.lang.openSourceLicenses),
                leading: const Icon(Icons.verified_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const LicensePage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(context.lang.version),
                subtitle: const Text('1.0.0'),
                leading: const Icon(Icons.info_outline),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
