import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:go_router/go_router.dart';

class MySettingPage extends StatelessWidget {
  const MySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: context.lang.settings,
      ),
      body: BodyWidget(
        child: ListView(
          children: [
            Text(
              'Account',
              style: context.bodySmall,
            ),
            const SettingListTile(
              icon: Icons.account_circle_outlined,
              label: 'Account details',
            ),
            verticalMargin20,
            Text(
              'Preferences',
              style: context.bodySmall,
            ),
            SettingListTile(
              icon: Icons.language,
              label: context.lang.language,
              onTap: () => context.push(MyRoutes.languageScreen),
            ),
            SettingListTile(
              icon: Icons.dark_mode_outlined,
              label: 'Theme mode',
              onTap: () => context.push(MyRoutes.themeScreen),
            ),
            SettingListTile(
              icon: Icons.notifications_outlined,
              label: context.lang.notifications,
              trailing: Switch.adaptive(
                value: false,
                onChanged: (value) {},
              ),
            ),
            verticalMargin20,
            Text(
              'Policies',
              style: context.bodySmall,
            ),
            const SettingListTile(
              icon: Icons.info_outline,
              label: 'Privacy Policy',
            ),
            const SettingListTile(
              icon: Icons.info_outline,
              label: 'Terms & Conditions',
            ),
            verticalMargin20,
            Text(
              'About',
              style: context.bodySmall,
            ),
            const SettingListTile(
              icon: Icons.mail_outline,
              label: 'Contact Us',
            ),
            const SettingListTile(
              icon: Icons.star_border,
              label: 'Rate Us',
            ),
            const SettingListTile(
              icon: Icons.device_unknown,
              label: 'Open Source Licenses',
            ),
            verticalMargin48,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made with 💗 in India',
                    style: context.bodySmall,
                  ),
                  verticalMargin2,
                  Text(
                    'Copyright @ 2024 Prashant Nigam',
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
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    required this.label,
    required this.icon,
    this.onTap,
    this.trailing,
    super.key,
  });

  final String label;
  final IconData icon;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 24),
      title: Text(
        label,
        style: context.titleMedium,
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }
}
