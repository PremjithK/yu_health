import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/ui/core/providers/date_picker_provider.dart';
import 'package:yu_health/ui/core/providers/password_visibility_provider.dart';
import 'package:yu_health/ui/core/providers/segmented_provider.dart';
import 'package:yu_health/core/utils/validators.dart';
import 'package:yu_health/ui/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/ui/core/widgets/yu_textfield.dart';
import 'package:yu_health/ui/screens/signup_page/bloc/signup_bloc.dart';
import 'package:yu_health/ui/screens/signup_page/provider/signup_form_provider.dart';

class CredentialsPart extends StatelessWidget {
  const CredentialsPart({super.key});

  @override
  Widget build(BuildContext context) {
    final signupProvider = context.read<SignupFormProvider>();
    return Padding(
      padding: PageLayout.pagePadding,
      child: Consumer<ObscurePasswordProvider>(
        builder: (context, provider, _) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Credentials',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Gap(10.h),
            YuTextField(
              prefixIcon: const Icon(Icons.email),
              hint: 'Email',
              validator: (value) => Validators.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              controller: signupProvider.emailController,
            ),
            Gap(10.h),
            YuTextField(
              prefixIcon: const Icon(Icons.phone),
              hint: 'Phone Number',
              validator: (value) => Validators.validatePhoneNumber(value),
              keyboardType: TextInputType.phone,
              controller: signupProvider.phoneNumberController,
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
              controller: signupProvider.passwordController,
            ),
            Gap(10.h),
            YuTextField(
              obscureText: provider.passwordHidden,
              prefixIcon: const Icon(Icons.lock),
              hint: 'Confirm Password',
              validator: (value) => Validators.validateConfirmPassword(
                signupProvider.passwordController.text.trim(),
                signupProvider.confirmPasswordController.text.trim(),
              ),
              controller: signupProvider.confirmPasswordController,
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
                      signupProvider.pageController.previousPage(
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
                    onPressed: () {
                      if (signupProvider.signupFormKey.currentState!
                          .validate()) {
                        context.read<SignupBloc>().add(
                              SignupFormSubmittedEvent(
                                firstName: signupProvider
                                    .firstNameController.text
                                    .trim(),
                                lastName: signupProvider.lastNameController.text
                                    .trim(),
                                email:
                                    signupProvider.emailController.text.trim(),
                                password: signupProvider.passwordController.text
                                    .trim(),
                                gender: context
                                    .read<GenderPickerProvider>()
                                    .selectedGender,
                                dateOfBirth:
                                    context.read<DatePickerProvider>().date,
                                phoneNumber: double.parse(
                                  signupProvider.phoneNumberController.text
                                      .trim(),
                                ),
                              ),
                            );
                      }
                    },
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
