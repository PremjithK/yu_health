import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/core/config/theme.dart';

class YuTextField extends StatelessWidget {
  const YuTextField({
    super.key,
    this.hint,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType,
    this.enabled = true,
    this.filled = false,
    this.maxLines = 1,
    this.onChanged,
    this.suffixIcon,
    this.readOnly,
    this.initialValue,
    this.onTap,
    this.padding,
    this.maxLength,
  });

  final Widget? suffixIcon;
  final String? hint;
  final bool enabled;
  final bool filled;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final bool? readOnly;
  final String? initialValue;
  final EdgeInsetsGeometry? padding;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    //! Theme
    final theme = Theme.of(context).colorScheme;
    return TextFormField(
      // Config
      key: key,

      initialValue: initialValue,
      readOnly: readOnly ?? false,
      onTap: onTap,
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines,

      maxLength: maxLength ?? 99,
      //Events
      onChanged: onChanged,

      // INPUT TEXT STYLE
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
        letterSpacing: 0.5,
        color: theme.onSurface,
      ),

      //Decoration
      decoration: InputDecoration(
        counterText: "",
        enabled: enabled,

        //& Disabled Border
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          borderSide: BorderSide(
            color: theme.outline.withOpacity(0.25),
          ),
        ),
        //& ERROR MESSAGE STYLE
        errorStyle: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        filled: filled,
        fillColor: theme.surface,
        // & Default Border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
        ),
        // & Enabled Border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          borderSide: BorderSide(color: theme.outline.withOpacity(0.5)),
        ),
        // & Focused Border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          borderSide: BorderSide(
            color: theme.primary,
          ),
        ),
        // LABEL STYLES
        // HINT STYLES
        labelText: hint,
        floatingLabelStyle: TextStyle(
          fontFamily: primaryFont,
          fontSize: 14.sp,
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color:
              Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.35),
        ),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        contentPadding: padding ??
            EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 12.h,
            ),
      ),
    );
  }
}
