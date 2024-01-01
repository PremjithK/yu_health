import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/theme.dart';

class IconSegment extends StatelessWidget {
  const IconSegment({
    super.key,
    required this.label,
    required this.icon,
    this.currentValue,
  });
  final String? currentValue;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentValue?.toUpperCase() == label.toUpperCase();
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;
    final Color color = isSelected
        ? darkMode
            ? lightColorScheme.onBackground
            : darkColorScheme.onBackground
        : Theme.of(context).colorScheme.onBackground;
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(
              data: IconThemeData(
                color: color,
              ),
              child: icon),
          const Gap(5),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontSize: 14.sp,
                ),
          ),
        ],
      ),
    );
  }
}
