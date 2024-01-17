import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';

class DashBannerItem extends StatelessWidget {
  const DashBannerItem({
    required this.title,
    super.key,
    this.icon,
    this.onTap,
    this.subtitle,
  });

  final Icon? icon;
  final String title;
  final void Function()? onTap;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: theme.primary,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(2, -2),
              color: theme.primary.withOpacity(0.15),
            ),
          ],
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon != null)
              IconTheme(
                  data: IconThemeData(
                    color: theme.background,
                  ),
                  child: icon!),
            Gap(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    color: theme.background,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: textTheme.bodySmall?.copyWith(
                      color: theme.background.withOpacity(0.5),
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
