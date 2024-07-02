import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/entities/user_entity.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/body_widget.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:flutter_template/views/components/input_field.dart';
import 'package:flutter_template/views/components/navbar.dart';
import 'package:flutter_template/views/screens/auth/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class MySignUpScreen extends StatefulWidget {
  const MySignUpScreen({super.key});

  @override
  State<MySignUpScreen> createState() => _MySignUpScreenState();
}

class _MySignUpScreenState extends State<MySignUpScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            context.pushReplacement(MyRoutes.home);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: headerNav(
              context,
              title: context.lang.welcome,
            ),
            body: BodyWidget(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWithLabel(
                      controller: _nameController,
                      label: context.lang.name,
                      hintText: context.lang.enterName,
                    ),
                    verticalMargin24,
                    TextFieldWithLabel(
                      controller: _phoneController,
                      label: context.lang.phone,
                      hintText: context.lang.enterPhone,
                    ),
                    verticalMargin24,
                    TextFieldWithLabel(
                      controller: _emailController,
                      label: context.lang.email,
                      hintText: context.lang.enterEmail,
                    ),
                    verticalMargin24,
                    TextFieldWithLabel(
                      controller: _passwordController,
                      label: context.lang.password,
                      hintText: context.lang.enterPassword,
                      isSecret: true,
                    ),
                    verticalMargin24,
                    TextFieldWithLabel(
                      controller: _confirmPasswordController,
                      label: context.lang.confirmPassword,
                      hintText: context.lang.enterConfirmPassword,
                      isSecret: true,
                    ),
                    const Spacer(flex: 3),
                    CustomElevatedButton(
                      label: context.lang.register,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final name = _nameController.text;
                          final phone = _phoneController.text;
                          final email = _emailController.text;
                          final password = _passwordController.text;

                          final user = UserEntity(
                            name: name,
                            phone: phone,
                            email: email,
                            password: password,
                          );

                          context.read<AuthBloc>().add(
                                RegisterEvent(
                                  userEntity: user,
                                ),
                              );
                        }
                      },
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
            ),
          );
        },
      ),
    );
  }
}
