import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/views/components/navbar.dart';

class MyAccountDetailScreen extends StatelessWidget {
  const MyAccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: context.lang.accountDetails,
      ),
    );
  }
}
