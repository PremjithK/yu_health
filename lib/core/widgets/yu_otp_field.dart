import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:yu_health/core/config/layout.dart';

class YuOtpField extends StatelessWidget {
  const YuOtpField({
    super.key,
    this.controller,
    this.validator,
    this.onCompleted,
    this.enabled,
  });

  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final void Function(String value)? onCompleted;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Pinput(
      length: 5,
      controller: controller,
      keyboardType: TextInputType.number,
      validator: validator,
      onCompleted: onCompleted,
      enabled: enabled ?? true,
      autofocus: true,

      //Styles
      defaultPinTheme: PinTheme(
        width: 41.w,
        height: 45.h,
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
          height: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          border: Border.all(
            color: theme.onBackground.withOpacity(0.5),
            width: 1,
          ),
          color: theme.background,
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 41.w,
        height: 45.h,
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
          height: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          border: Border.all(
            color: theme.primary,
            width: 1,
          ),
          color: theme.background,
        ),
      ),
      disabledPinTheme: PinTheme(
        width: 41.w,
        height: 45.h,
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: theme.surfaceVariant.withOpacity(0.75),
          letterSpacing: -1,
          height: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          border: Border.all(
            color: theme.surfaceVariant.withOpacity(0.5),
            width: 1,
          ),
          color: theme.surfaceVariant.withOpacity(0.15),
        ),
      ),
      followingPinTheme: PinTheme(
        width: 41.w,
        height: 45.h,
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
          height: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          border: Border.all(
            color: theme.primary,
            width: 2,
          ),
          color: theme.background,
        ),
      ),
      errorPinTheme: PinTheme(
        width: 41.w,
        height: 45.h,
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
          height: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          border: Border.all(
            color: theme.error,
            width: 2,
          ),
          color: theme.errorContainer,
        ),
      ),
    );
  }
}
