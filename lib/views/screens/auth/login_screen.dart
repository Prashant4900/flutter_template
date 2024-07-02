import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/input_field.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:flutter_template/views/screens/auth/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({super.key});

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
            appBar: headerNav(context, title: context.lang.welcomeBack),
            body: BodyWidget(
              child: Column(
                children: [
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
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () =>
                          context.push(MyRoutes.forgotPasswordScreen),
                      child: Text(
                        context.lang.forgotPassword,
                        style: context.bodySmall,
                      ),
                    ),
                  ),
                  const Spacer(flex: 3),
                  CustomElevatedButton(
                    label: context.lang.login,
                    onPressed: () => context.pushReplacement(MyRoutes.home),
                  ),
                  verticalMargin20,
                  CustomElevatedButton(
                    label: context.lang.continueWithPhone,
                    onPressed: () => context.push(MyRoutes.phoneScreen),
                  ),
                  verticalMargin24,
                  Column(
                    children: [
                      Text(
                        context.lang.loginWithSocial,
                        style: context.bodyMedium,
                      ),
                      verticalMargin8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () =>
                                context.pushReplacement(MyRoutes.home),
                            icon: Assets.svg.google.svg(width: 32),
                          ),
                          IconButton(
                            onPressed: () =>
                                context.pushReplacement(MyRoutes.home),
                            icon: Assets.svg.apple.svg(width: 32),
                          ),
                          IconButton(
                            onPressed: () =>
                                context.pushReplacement(MyRoutes.home),
                            icon: Assets.svg.facebook.svg(width: 32),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      style: context.bodySmall,
                      children: [
                        TextSpan(
                          text: context.lang.ifYouDontHaveAccount,
                        ),
                        TextSpan(
                          text: context.lang.register,
                          style: context.labelSmall?.copyWith(
                            color: context.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.push(MyRoutes.signUpScreen),
                        ),
                      ],
                    ),
                  ),
                  verticalMargin24,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
