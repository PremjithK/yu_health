import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/core/utils/page_transitions.dart';
import 'package:yu_health/ui/core/utils/validators.dart';
import 'package:yu_health/ui/core/widgets/alerts.dart';
import 'package:yu_health/ui/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/ui/core/widgets/yu_text_button.dart';
import 'package:yu_health/ui/core/widgets/yu_textfield.dart';
import 'package:yu_health/ui/screens/home_page/home_page.dart';
import 'package:yu_health/ui/screens/login_page/bloc/login_bloc.dart';
import 'package:yu_health/ui/screens/signup_page/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: PageLayout.pagePadding,
            // Form Components
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.push(
                    context,
                    PageTransitionWrapper(
                      duration: Durations.long1,
                      page: HomePage(),
                      transitionType: PageTransitionType.slideLeft,
                      curve: Curves.ease,
                    ),
                  );
                } else if (state is LoginFailed) {
                  YuBottomSheets.showErrorBottomSheet(
                    context,
                    title: state.title,
                    message: state.message,
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      YuTextField(
                        prefixIcon: const Icon(Icons.email),
                        hint: 'Email',
                        validator: (value) => Validators.validateEmail(value),
                        controller: _emailController,
                      ),
                      Gap(10.h),
                      YuTextField(
                        prefixIcon: const Icon(Icons.lock),
                        hint: 'Password',
                        validator: (value) =>
                            Validators.validatePassword(value),
                        controller: _passwordController,
                      ),
                      Gap(10.h),
                      YuTextButton(
                        label: 'Forgot password',
                        onPressed: () {},
                      ),
                      Gap(10.h),
                      SizedBox(
                        width: double.infinity,
                        child: YuElevatedButton(
                          label: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginFormSubmittedEvent(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            } else {
                              YuBottomSheets.showErrorBottomSheet(
                                context,
                                title: 'Invalid Submission',
                                message: 'Please enter valid credentials',
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: YuElevatedButtonAlt(
                          label: 'Create an account',
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransitionWrapper(
                                duration: Durations.long1,
                                page: const SignUpPage(),
                                transitionType: PageTransitionType.slideLeft,
                                curve: Curves.ease,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
