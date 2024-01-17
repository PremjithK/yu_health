import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/core/config/theme.dart';

TextTheme textTheme = TextTheme(
  labelSmall: TextStyle(
    fontSize: 12.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
  ),
  labelMedium: TextStyle(
    fontSize: 14.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
  ),
  labelLarge: TextStyle(
    fontSize: 16.sp,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
  ),
  bodySmall: TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.3,
  ),

  // App bar uses titleSmall
  titleSmall: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    height: 1.1,
  ),
  titleMedium: TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
    height: 1.2,
  ),
  titleLarge: TextStyle(
    fontFamily: primaryFont,
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
    height: 1.2,
  ),
  displayLarge: TextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.5,
    height: 1,
  ),
  displayMedium: TextStyle(
    fontSize: 45.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.5,
    height: 1,
  ),
  displaySmall: TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.25,
    height: 1,
  ),
);
