import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/core/utils/page_transitions.dart';
import 'package:yu_health/core/widgets/alerts.dart';
import 'package:yu_health/screens/signup_page/credentials.dart';
import 'package:yu_health/screens/signup_page/personal_info.dart';
import 'package:yu_health/screens/signup_page/provider/signup_form_provider.dart';
import 'package:yu_health/screens/signup_page/signup_bloc/signup_bloc.dart';
import 'package:yu_health/ui/screens/signup_page/verify_email.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final signupProvider = context.read<SignupFormProvider>();
    return Scaffold(
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupFailed) {
            YuBottomSheets.showErrorBottomSheet(
              context,
              title: state.title,
              message: state.message,
            );
          }
          if (state is SingupComplete) {
            context.read<SignupFormProvider>().clearControllers();
            Navigator.pushReplacement(
              context,
              TransitionedRoute(
                duration: Durations.long2,
                page: const EmailVerificationPage(),
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
            key: signupProvider.signupFormKey,
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
                      controller: signupProvider.pageController,
                      children: const [
                        PersonalInfoPart(),
                        CredentialsPart(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
