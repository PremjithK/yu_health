import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';

class ConsultButton extends StatelessWidget {
  const ConsultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(ButtonLayout.borderRadius),
      ),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.stethoscope,
            color: Colors.white,
            size: 20.sp,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
              )
            ],
          ),
          Gap(10.w),
          Text(
            'Consult Now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
