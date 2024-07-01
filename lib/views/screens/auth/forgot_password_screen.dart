import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/input_field.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:go_router/go_router.dart';

class MyForgotPasswordScreen extends StatelessWidget {
  const MyForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: context.lang.forgotPassword,
      ),
      body: BodyWidget(
        child: Column(
          children: [
            Text(
              context.lang.resetPasswordConfirm,
              style: context.bodyLarge,
            ),
            verticalMargin48,
            TextFieldWithLabel(
              label: context.lang.email,
              hintText: context.lang.enterEmail,
              isSecret: true,
            ),
            const Spacer(),
            CustomElevatedButton(
              label: context.lang.resetPassword,
              onPressed: () => context.pushReplacement(MyRoutes.logInScreen),
            ),
          ],
        ),
      ),
    );
  }
}
