import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/input_field.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:flutter_template/views/screens/auth/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class MyPhoneScreen extends StatefulWidget {
  const MyPhoneScreen({super.key});

  @override
  State<MyPhoneScreen> createState() => _MyPhoneScreenState();
}

class _MyPhoneScreenState extends State<MyPhoneScreen> {
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

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
            context.pushReplacement(MyRoutes.otpScreen);
          }
        },
        builder: (context, state) {
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
                    controller: _phoneController,
                    label: context.lang.phone,
                    hintText: '+91 0123456789',
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    label: context.lang.cont,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            RequestOtpEvent(
                              phone: _phoneController.text,
                            ),
                          );
                    },
                  ),
                  verticalMargin32,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
