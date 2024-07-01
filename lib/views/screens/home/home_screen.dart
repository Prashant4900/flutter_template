import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: context.lang.home,
        action: IconButton(
          onPressed: () => context.push(MyRoutes.notificationScreen),
          icon: const Icon(Icons.notifications_none),
        ),
      ),
      body: Center(
        child: Text(context.lang.home),
      ),
    );
  }
}
