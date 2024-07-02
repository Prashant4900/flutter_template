import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class MyOtpScreen extends StatefulWidget {
  const MyOtpScreen({super.key});

  @override
  State<MyOtpScreen> createState() => _MyOtpScreenState();
}

class _MyOtpScreenState extends State<MyOtpScreen> {
  late final OtpFieldControllerV2 _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = OtpFieldControllerV2();
  }

  @override
  void dispose() {
    _otpController.clear();
    super.dispose();
  }

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
            OTPTextFieldV2(
              controller: _otpController,
              width: MediaQuery.sizeOf(context).width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              length: 5,
              fieldStyle: FieldStyle.box,
              fieldWidth: 50,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor:
                    context.colorScheme.primaryContainer.withOpacity(.5),
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
              label: context.lang.save,
              onPressed: () => context.push(MyRoutes.home),
            ),
            verticalMargin32,
          ],
        ),
      ),
    );
  }
}
