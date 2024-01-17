import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/providers/segmented_provider.dart';

class SegmentedControl extends StatelessWidget {
  const SegmentedControl({
    super.key,
    required this.defaultValue,
    required this.onValueChanged,
    required this.segments,
    this.width,
    this.backgroundColor,
  });
  final double? width;
  final String? defaultValue;
  final void Function(String? value) onValueChanged;
  final Map<String, Widget> segments;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? ScreenUtil.defaultSize.width,
      child: CupertinoSlidingSegmentedControl<String>(
        children: segments,
        groupValue: defaultValue,
        onValueChanged: onValueChanged,
        backgroundColor: backgroundColor ?? Colors.transparent,
        thumbColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class SegmentItem extends StatelessWidget {
  const SegmentItem({
    super.key,
    this.icon,
    required this.label,
  });

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        Provider.of<GenderPickerProvider>(context).selectedGender == label;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.75),
            ),
          Gap(5.w),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}
