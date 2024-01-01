import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/ui/core/providers/password_visibility_provider.dart';
import 'package:yu_health/core/utils/page_transitions.dart';
import 'package:yu_health/core/utils/validators.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => SystemNavigator.pop(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: PageLayout.pagePadding,
              // Form Components
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushReplacement(
                      context,
                      TransitionedRoute(
                        duration: Durations.long1,
                        page: const HomePage(),
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
                        Text(
                          'YuCare',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),

                        Gap(25.h),
                        YuTextField(
                          controller: _emailController,
                          prefixIcon: const Icon(Icons.email),
                          hint: 'Email',
                          validator: (value) => Validators.validateEmail(value),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Gap(10.h),

                        // Password form field with show/hide button
                        ChangeNotifierProvider(
                          create: (context) => ObscurePasswordProvider(),
                          child: Consumer<ObscurePasswordProvider>(
                            builder: (context, provider, _) => YuTextField(
                              controller: _passwordController,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () => context
                                    .read<ObscurePasswordProvider>()
                                    .toggleLoginPasswordVisibility(),
                                icon: Icon(
                                  provider.loginPasswordHidden
                                      ? CupertinoIcons.eye_slash_fill
                                      : CupertinoIcons.eye_fill,
                                ),
                              ),
                              hint: 'Password',
                              validator: (value) =>
                                  Validators.validateLoginPassword(value),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: provider.loginPasswordHidden,
                            ),
                          ),
                        ),
                        Gap(10.h),
                        YuTextButton(
                          label: 'Forgot password',
                          onPressed: () {},
                        ),
                        Gap(10.h),
                        YuElevatedButton(
                          width: ScreenUtil.defaultSize.width,
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
                        YuElevatedButtonAlt(
                          width: ScreenUtil.defaultSize.width,
                          label: 'Create an account',
                          onPressed: () {
                            Navigator.push(
                              context,
                              TransitionedRoute(
                                duration: Durations.long1,
                                page: const SignUpPage(),
                                transitionType: PageTransitionType.slideLeft,
                                curve: Curves.ease,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
