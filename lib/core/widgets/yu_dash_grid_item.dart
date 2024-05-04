import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';

class DashGridItem extends StatelessWidget {
  const DashGridItem({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  final String label;
  final Icon icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStatePropertyAll(theme.primary.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
          color: theme.background,
          border: Border.all(
            color: theme.onBackground.withOpacity(0.25),
          ),
          boxShadow: [
            BoxShadow(
              color: theme.primary.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconTheme(
                data: IconThemeData(
                  color: theme.primary,
                  size: 30.sp,
                ),
                child: icon),
            Gap(5.h),
            Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                color: theme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
