import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/ui/core/providers/date_picker_provider.dart';
import 'package:yu_health/ui/core/providers/password_visibility_provider.dart';
import 'package:yu_health/ui/core/providers/segmented_provider.dart';
import 'package:yu_health/ui/core/utils/page_transitions.dart';
import 'package:yu_health/ui/core/widgets/alerts.dart';
import 'package:yu_health/ui/screens/home_page/home_page.dart';
import 'package:yu_health/ui/screens/signup_page/bloc/signup_bloc.dart';
import 'package:yu_health/ui/screens/signup_page/credentials.dart';
import 'package:yu_health/ui/screens/signup_page/personal_info.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Image holder

  // Page
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GenderPickerProvider()),
        ChangeNotifierProvider(create: (context) => ObscurePasswordProvider()),
        ChangeNotifierProvider(create: (context) => DatePickerProvider()),
      ],
      builder: (context, _) => Scaffold(
        body: BlocProvider(
          create: (context) => SignupBloc(),
          child: BlocConsumer<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is SignupFailed) {
                YuBottomSheets.showErrorBottomSheet(
                  context,
                  title: state.title,
                  message: state.message,
                );
              }
              if (state is SignupSuccess) {
                Navigator.pushReplacement(
                  context,
                  TransitionedRoute(
                    duration: Durations.long2,
                    page: const HomePage(),
                    transitionType: PageTransitionType.slideLeft,
                    curve: Curves.ease,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is SignupLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 450.h,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          children: [
                            PersonalInfoPart(
                              formKey: _formKey,
                              pageController: _pageController,
                              firstNameController: _firstNameController,
                              lastNameController: _lastNameController,
                            ),
                            CredentialsPart(
                              formKey: _formKey,
                              pageController: _pageController,
                              emailController: _emailController,
                              passwordController: _passwordController,
                              confirmPasswordController:
                                  _confirmPasswordController,
                              phoneNumberController: _phoneController,
                              onSubmitted: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignupBloc>().add(
                                        SignupFormSubmittedEvent(
                                          firstName:
                                              _firstNameController.text.trim(),
                                          lastName:
                                              _lastNameController.text.trim(),
                                          email: _emailController.text.trim(),
                                          password:
                                              _passwordController.text.trim(),
                                          gender: context
                                              .read<GenderPickerProvider>()
                                              .selectedGender!,
                                          dateOfBirth: DateTime.now(),
                                          phoneNumber: double.parse(
                                            _phoneController.text.trim(),
                                          ),
                                        ),
                                      );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
