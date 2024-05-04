import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/core/utils/validators.dart';
import 'package:yu_health/core/widgets/alerts.dart';
import 'package:yu_health/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/core/widgets/yu_textfield.dart';
import 'package:yu_health/screens/enter_emal_for_reset/bloc/reset_pass_email_bloc.dart';

class EnterEmailForResetPasswordPage extends StatefulWidget {
  const EnterEmailForResetPasswordPage({super.key});

  @override
  State<EnterEmailForResetPasswordPage> createState() =>
      _EnterEmailForResetPasswordPageState();
}

class _EnterEmailForResetPasswordPageState
    extends State<EnterEmailForResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPassEmailBloc, ResetPassEmailState>(
      listener: (context, state) {
        if (state is ResetPassEmailError) {
          YuBottomSheets.showErrorBottomSheet(
            context,
            title: 'Error',
            message: 'Failed to send password reset link',
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: PageLayout.pagePadding,
              // Form Components
              child: Column(
                children: [
                  Text(
                    'Enter your email',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const Gap(10),
                  Text(
                    'A link to reset your password will be sent to this email',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(15),
                  YuTextField(
                    controller: _emailController,
                    validator: (value) => Validators.validateEmail(value),
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  Gap(10.h),
                  BlocBuilder<ResetPassEmailBloc, ResetPassEmailState>(
                    builder: (context, state) {
                      if (state is ResetPassEmailLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return YuElevatedButton(
                        width: double.maxFinite,
                        label: 'Send',
                        onPressed: () {
                          context.read<ResetPassEmailBloc>().add(
                                ResetPassEmailSubmitted(
                                  _emailController.text.trim(),
                                ),
                              );
                        },
                      );
                    },
                  ),
                  const Gap(5),
                  YuElevatedButtonAlt(
                    label: 'Go Back',
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
