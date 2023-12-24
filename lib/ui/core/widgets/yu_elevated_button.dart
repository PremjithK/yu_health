import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/core/config/theme.dart';

class YuElevatedButton extends StatelessWidget {
  const YuElevatedButton({
    required this.label,
    required this.onPressed,
    this.width,
    super.key,
    this.icon,
    this.direction,
  });

  final String label;
  final void Function()? onPressed;
  final double? width;
  final Widget? icon;
  final TextDirection? direction;

  @override
  Widget build(BuildContext context) {
    // UI
    if (icon == null) {
      return Container(
        width: width,
        decoration: _buttonShadow(context),
        child: ElevatedButton(
          onPressed: onPressed,
          style: _primaryButtonStyle(context),
          child: Text(label),
        ),
      );
    } else {
      return Container(
        width: width,
        decoration: _buttonShadow(context),
        child: ElevatedButton(
          onPressed: onPressed,
          style: _primaryButtonStyle(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: direction ?? TextDirection.ltr,
            children: [
              icon!,
              Gap(10.w),
              Text(label),
            ],
          ),
        ),
      );
    }
  }
}

class YuElevatedButtonAlt extends StatelessWidget {
  const YuElevatedButtonAlt({
    required this.label,
    required this.onPressed,
    this.width,
    super.key,
    this.icon,
    this.direction,
  });

  final String label;
  final void Function()? onPressed;
  final double? width;
  final Widget? icon;
  final TextDirection? direction;

  @override
  Widget build(BuildContext context) {
    // UI
    if (icon == null) {
      return Container(
        width: width,
        decoration: _buttonShadowAlt(context),
        child: ElevatedButton(
          onPressed: onPressed,
          style: _secondaryButtonStyle(context),
          child: Text(label),
        ),
      );
    } else {
      return Container(
        width: width,
        decoration: _buttonShadowAlt(context),
        child: ElevatedButton(
          onPressed: onPressed,
          style: _secondaryButtonStyle(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: direction ?? TextDirection.ltr,
            children: [
              icon!,
              Gap(10.w),
              Text(label),
            ],
          ),
        ),
      );
    }
  }
}

_buttonShadow(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
    boxShadow: [
      BoxShadow(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        blurRadius: 4,
        offset: const Offset(-1, 1),
      ),
    ],
  );
}

_buttonShadowAlt(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
    boxShadow: [
      BoxShadow(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        blurRadius: 2,
        offset: const Offset(-1, 1),
      ),
    ],
  );
}

ButtonStyle _primaryButtonStyle(BuildContext context) {
  final theme = Theme.of(context).colorScheme;
  return ButtonStyle(
    alignment: Alignment.center,
    elevation: const MaterialStatePropertyAll(0),

    // bg
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return theme.primary.withOpacity(0.75);
      } else {
        return theme.primary;
      }
    }),

    padding: MaterialStatePropertyAll(
      EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 12.h,
      ),
    ),

    foregroundColor: MaterialStatePropertyAll(theme.onPrimary),

    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
      ),
    ),

    iconColor: MaterialStatePropertyAll(theme.onPrimary),
    iconSize: MaterialStatePropertyAll(18.sp),

    //
    textStyle: MaterialStatePropertyAll(
      TextStyle(
        fontFamily: primaryFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        height: 1.1,
      ),
    ),
  );
}

ButtonStyle _secondaryButtonStyle(BuildContext context) {
  final theme = Theme.of(context).colorScheme;
  return ButtonStyle(
    alignment: Alignment.center,
    elevation: const MaterialStatePropertyAll(0),

    // bg
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return theme.onPrimary.withOpacity(0.5);
      } else {
        return theme.background;
      }
    }),

    padding: MaterialStatePropertyAll(
      EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 12.h,
      ),
    ),

    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
        side: BorderSide(
          width: 1,
          color: theme.primary,
        ),
      ),
    ),

    foregroundColor: MaterialStatePropertyAll(theme.primary),
    iconColor: MaterialStatePropertyAll(theme.primary),
    iconSize: MaterialStatePropertyAll(18.sp),

    // text
    textStyle: MaterialStatePropertyAll(
      TextStyle(
        fontFamily: primaryFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        height: 1.1,
      ),
    ),
  );
}
