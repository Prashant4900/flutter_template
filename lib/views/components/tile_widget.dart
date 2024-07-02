import 'package:flutter/material.dart';
import 'package:flutter_template/theme/theme_manager.dart';

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
