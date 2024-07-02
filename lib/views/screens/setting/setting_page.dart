import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/utility/url_utility.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:flutter_template/views/components/tile_widget.dart';
import 'package:flutter_template/views/screens/setting/bloc/setting_bloc.dart';
import 'package:go_router/go_router.dart';

class MySettingPage extends StatefulWidget {
  const MySettingPage({super.key});

  @override
  State<MySettingPage> createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {
  final _notificationNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingBloc(),
      child: BlocConsumer<SettingBloc, SettingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: headerNav(
              context,
              title: context.lang.settings,
            ),
            body: BodyWidget(
              child: ListView(
                children: [
                  verticalMargin24,
                  Text(
                    context.lang.account,
                    style: context.bodySmall,
                  ),
                  SettingListTile(
                    icon: Icons.account_circle_outlined,
                    label: context.lang.accountDetails,
                    onTap: () => context.push(MyRoutes.accountDetailScreen),
                  ),
                  verticalMargin20,
                  Text(
                    context.lang.preferences,
                    style: context.bodySmall,
                  ),
                  SettingListTile(
                    icon: Icons.language,
                    label: context.lang.language,
                    onTap: () => context.push(MyRoutes.languageScreen),
                  ),
                  SettingListTile(
                    icon: Icons.dark_mode_outlined,
                    label: context.lang.themeMode,
                    onTap: () => context.push(MyRoutes.themeScreen),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _notificationNotifier,
                    builder: (context, value, _) {
                      return SettingListTile(
                        icon: Icons.notifications_outlined,
                        label: context.lang.notifications,
                        trailing: Switch.adaptive(
                          value: value,
                          onChanged: (val) {
                            _notificationNotifier.value = val;
                          },
                        ),
                      );
                    },
                  ),
                  verticalMargin20,
                  Text(
                    context.lang.policies,
                    style: context.bodySmall,
                  ),
                  SettingListTile(
                    icon: Icons.info_outline,
                    label: context.lang.privacyPolicy,
                  ),
                  SettingListTile(
                    icon: Icons.info_outline,
                    label: context.lang.termAndCondition,
                  ),
                  verticalMargin20,
                  Text(
                    context.lang.about,
                    style: context.bodySmall,
                  ),
                  SettingListTile(
                    icon: Icons.mail_outline,
                    label: context.lang.contactUs,
                    onTap: () async => UrlUtility.contactUs(),
                  ),
                  SettingListTile(
                    icon: Icons.star_border,
                    label: context.lang.rateUs,
                  ),
                  SettingListTile(
                    icon: Icons.device_unknown,
                    label: context.lang.openSourceLicense,
                    onTap: () => showAboutDialog(context: context),
                  ),
                  verticalMargin48,
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.lang.madeWithLove,
                          style: context.bodySmall,
                        ),
                        verticalMargin2,
                        Text(
                          context.lang.copyright2024,
                          style: context.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  verticalMargin24,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
