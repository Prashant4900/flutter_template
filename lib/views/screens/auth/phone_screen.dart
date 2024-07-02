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

class MyPhoneScreen extends StatelessWidget {
  const MyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(context),
      body: BodyWidget(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                context.lang.continueWithPhone,
                style: context.headlineSmall,
              ),
            ),
            verticalMargin24,
            TextFieldWithLabel(
              label: context.lang.phone,
              hintText: '+91 0123456789',
            ),
            const Spacer(),
            CustomElevatedButton(
              label: context.lang.cont,
              onPressed: () => context.push(MyRoutes.otpScreen),
            ),
            verticalMargin32,
          ],
        ),
      ),
    );
  }
}
