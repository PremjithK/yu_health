import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/core/config/text_theme.dart';
import 'package:yu_health/core/utils/page_transitions.dart';
import 'package:yu_health/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/screens/home_page/home_page.dart';
import 'package:yu_health/screens/signup_page/signup_bloc/signup_bloc.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  void initState() {
    super.initState();
    print(FirebaseAuth.instance.currentUser!.displayName);
    context.read<SignupBloc>().add(EmailVerificationRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is EmailVerified) {
            Navigator.pushReplacement(
              context,
              TransitionedRoute(
                page: const HomePage(),
              ),
            );
          }
        },
        child: Padding(
          padding: PageLayout.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verify Email',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(),
              ),
              Gap(20.h),
              Text(
                'A verification link has been sent to your email address',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
              ),
              Text(
                '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(),
              ),
              Gap(20.h),
              // const YuTextButton(
              //   label: 'Resend OTP',
              //   onPressed: null,
              //   icon: null,
              // ),
              Gap(10.h),
              // Submit button
              StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    print(snapshot.data?.emailVerified);
                    if (snapshot.data!.emailVerified) {
                      return YuElevatedButton(
                        width: 150.w,
                        label: 'Continue',
                        direction: TextDirection.rtl,
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            TransitionedRoute(page: const HomePage()),
                          );
                        },
                      );
                    } else {
                      return Text(
                        'Waiting for confirmation...',
                        style: textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                        ),
                      );
                    }
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
