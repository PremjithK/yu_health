import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/core/config/theme.dart';

final double _containerHeight = 80.h;

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.age,
    this.onTap,
  });

  final String name;
  final String email;
  final String age;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    // UI
    return InkWell(
      borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
      onTap: onTap,
      child: Ink(
        height: _containerHeight,
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: lightColorScheme.primary,
          borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: darkColorScheme.primaryContainer,
                  radius: 30.r,
                ),
                Gap(15.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13.sp,
                        height: 1.2,
                        overflow: TextOverflow.fade,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    Text(
                      '$age Years',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13.sp,
                        height: 1.2,
                        overflow: TextOverflow.fade,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
                Gap(20.w),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.75),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCardLoadingPlaceholder extends StatelessWidget {
  const ProfileCardLoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: _containerHeight,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: lightColorScheme.primary,
        borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
