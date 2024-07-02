import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:flutter_template/views/screens/auth/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class MyOtpScreen extends StatefulWidget {
  const MyOtpScreen({required this.phone, super.key});

  final String phone;

  @override
  State<MyOtpScreen> createState() => _MyOtpScreenState();
}

class _MyOtpScreenState extends State<MyOtpScreen> {
  final _otpNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }

          if (state is AuthSuccess) {
            context.pushReplacement(MyRoutes.home);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: headerNav(context),
            body: BodyWidget(
              child: ValueListenableBuilder(
                valueListenable: _otpNotifier,
                builder: (context, otp, _) {
                  return Column(
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
                        width: MediaQuery.sizeOf(context).width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        length: 5,
                        fieldStyle: FieldStyle.box,
                        fieldWidth: 50,
                        otpFieldStyle: OtpFieldStyle(
                          backgroundColor: context.colorScheme.primaryContainer
                              .withOpacity(.5),
                        ),
                        onChanged: (value) => otp = value,
                      ),
                      const Spacer(),
                      CustomElevatedButton(
                        label: context.lang.save,
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                SubmitOtpEvent(
                                  otp: otp!,
                                  phone: widget.phone,
                                ),
                              );
                        },
                      ),
                      verticalMargin32,
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
