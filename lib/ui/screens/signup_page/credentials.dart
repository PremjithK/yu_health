import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/core/providers/password_visibility_provider.dart';
import 'package:yu_health/ui/core/utils/validators.dart';
import 'package:yu_health/ui/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/ui/core/widgets/yu_textfield.dart';

class CredentialsPart extends StatelessWidget {
  const CredentialsPart({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.pageController,
    required this.formKey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageLayout.pagePadding,
      child: Consumer<ObscurePasswordProvider>(
        builder: (context, provider, _) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Setup Login Credentials'),
            Gap(20.h),
            YuTextField(
              prefixIcon: const Icon(Icons.email),
              hint: 'Email',
              validator: (value) => Validators.validateEmail(value),
              controller: emailController,
            ),
            Gap(10.h),
            YuTextField(
              suffixIcon: IconButton(
                icon: Icon(
                  provider.passwordHidden
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill,
                ),
                onPressed: () => context
                    .read<ObscurePasswordProvider>()
                    .togglePasswordVisibility(),
              ),
              obscureText: provider.passwordHidden,
              prefixIcon: const Icon(Icons.lock),
              hint: 'Password',
              validator: (value) => Validators.validatePassword(value),
              controller: passwordController,
            ),
            Gap(10.h),
            YuTextField(
              obscureText: provider.passwordHidden,
              prefixIcon: const Icon(Icons.lock),
              hint: 'Confirm Password',
              validator: (value) => Validators.validatePassword(value),
              controller: confirmPasswordController,
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: YuElevatedButtonAlt(
                    label: 'Go Back',
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      pageController.previousPage(
                        duration: Durations.long2,
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
                Gap(10.w),
                Expanded(
                  flex: 3,
                  child: YuElevatedButton(
                    label: 'Sign Up',
                    direction: TextDirection.rtl,
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
