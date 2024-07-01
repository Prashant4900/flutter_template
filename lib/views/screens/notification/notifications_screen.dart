import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/navbar.dart';

class MyNotificationScreen extends StatelessWidget {
  const MyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: context.lang.notifications,
      ),
      body: BodyWidget(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: context.colorScheme.primary,
                child: Text(
                  '$index',
                  style: context.bodyMedium?.copyWith(
                    color: context.onPrimary,
                  ),
                ),
              ),
              title: Text(
                'Notification $index',
                style: context.titleMedium,
              ),
              subtitle: Text(
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, libero eu aliqu am.''',
                style: context.bodySmall,
              ),
            );
          },
        ),
      ),
    );
  }
}
