import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/core/config/theme.dart';

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
  final void Function(String)? onChanged;
  final bool? readOnly;
  final String? initialValue;

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
        enabled: enabled,
        //& Disabled Border
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          borderSide: BorderSide(
            color: theme.outline.withOpacity(0.3),
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
        floatingLabelStyle: const TextStyle(fontFamily: primaryFont),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color:
              Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.75),
        ),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        contentPadding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 12.h,
        ),
      ),
    );
  }
}
