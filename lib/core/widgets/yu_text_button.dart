import 'package:flutter/material.dart';
import 'package:yu_health/core/config/theme.dart';

class YuTextButton extends StatelessWidget {
  const YuTextButton({
    super.key,
    this.icon,
    required this.label,
    this.onPressed,
  });

  final String label;
  final Widget? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return TextButton(
        style: _textButtonTheme(context),
        onPressed: onPressed,
        child: Text(label),
      );
    } else {
      return TextButton.icon(
        style: _textButtonTheme(context),
        onPressed: onPressed,
        icon: icon!,
        label: Text(label),
      );
    }
  }
}

_textButtonTheme(BuildContext context) {
  final theme = Theme.of(context).colorScheme;
  return ButtonStyle(
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.pressed)) {
          return theme.primary.withOpacity(0.75);
        } else {
          return theme.primary;
        }
      },
    ),
    textStyle: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.pressed)) {
          return const TextStyle(
            fontFamily: primaryFont,
            decoration: TextDecoration.underline,
          );
        } else {
          return const TextStyle(
            fontFamily: primaryFont,
          );
        }
      },
    ),
  );
}
