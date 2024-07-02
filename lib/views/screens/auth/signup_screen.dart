import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/input_field.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:go_router/go_router.dart';

class MySignUpScreen extends StatelessWidget {
  const MySignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(
        context,
        title: context.lang.welcome,
      ),
      body: BodyWidget(
        child: Column(
          children: [
            TextFieldWithLabel(
              label: context.lang.name,
              hintText: context.lang.enterName,
            ),
            verticalMargin24,
            TextFieldWithLabel(
              label: context.lang.phone,
              hintText: context.lang.enterPhone,
            ),
            verticalMargin24,
            TextFieldWithLabel(
              label: context.lang.email,
              hintText: context.lang.enterEmail,
            ),
            verticalMargin24,
            TextFieldWithLabel(
              label: context.lang.password,
              hintText: context.lang.enterPassword,
              isSecret: true,
            ),
            verticalMargin24,
            TextFieldWithLabel(
              label: context.lang.confirmPassword,
              hintText: context.lang.enterConfirmPassword,
              isSecret: true,
            ),
            const Spacer(flex: 3),
            CustomElevatedButton(
              label: context.lang.register,
              onPressed: () {},
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                style: context.bodySmall,
                children: [
                  TextSpan(text: context.lang.alreadyHaveAcc),
                  TextSpan(
                    text: context.lang.login,
                    style: context.labelSmall?.copyWith(
                      color: context.primary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.pop(),
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
