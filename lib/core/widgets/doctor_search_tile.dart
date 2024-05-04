import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';

class DoctorSearchTile extends StatelessWidget {
  const DoctorSearchTile({
    super.key,
    required this.name,
    required this.imageURL,
    required this.designation,
    required this.locationName,
    required this.onTap,
  });

  final String name;
  final String imageURL;
  final String designation;
  final String locationName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(
        ButtonLayout.borderRadius + 5,
      ),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme.surfaceVariant.withOpacity(0.5),
              blurRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              theme.surfaceVariant.withOpacity(0.15),
              theme.background,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(
            color: theme.surfaceVariant,
          ),
          borderRadius: BorderRadius.circular(
            ButtonLayout.borderRadius + 5,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 36.r,
            ),
            Gap(15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    height: 1,
                  ),
                ),
                Text(
                  designation,
                  style: TextStyle(
                    letterSpacing: 0,
                    height: 1.1,
                    fontSize: 14.sp,
                    color: theme.onBackground.withOpacity(0.5),
                  ),
                ),
                LabelWithIcon(
                  icon: Icons.location_pin,
                  iconColor: theme.onBackground,
                  label: locationName,
                ),
                LabelWithIcon(
                  icon: Icons.favorite,
                  iconColor: theme.error,
                  label: '890',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LabelWithIcon extends StatelessWidget {
  const LabelWithIcon({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor,
    this.textStyle,
  });
  final IconData icon;
  final String label;
  final Color? iconColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 18.r,
        ),
        const Gap(5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: textStyle ??
                  TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.75),
                    fontSize: 14.sp,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
