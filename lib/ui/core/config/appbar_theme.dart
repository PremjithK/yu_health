import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/ui/core/config/theme.dart';

final double _iconSize = 25.sp;
final double _titleFontSize = 21.sp;
final double _appbarHeight = 50.sp;

AppBarTheme appBarThemeLight = AppBarTheme(
  toolbarHeight: _appbarHeight,
  elevation: 0,
  scrolledUnderElevation: 0,
  actionsIconTheme: IconThemeData(
    color: lightColorScheme.onBackground,
    size: _iconSize,
  ),
  iconTheme: IconThemeData(
    color: lightColorScheme.onBackground,
    size: _iconSize,
  ),
  titleTextStyle: TextStyle(
    fontFamily: primaryFont,
    fontSize: _titleFontSize,
    fontWeight: FontWeight.bold,
    color: lightColorScheme.onBackground,
  ),
  backgroundColor: lightColorScheme.background,
  foregroundColor: lightColorScheme.onBackground,
  shadowColor: Colors.transparent,
);
AppBarTheme appBarThemeDark = AppBarTheme(
  toolbarHeight: _appbarHeight,
  elevation: 0,
  scrolledUnderElevation: 0,
  iconTheme: IconThemeData(
    color: darkColorScheme.onBackground,
    size: _iconSize,
  ),
  actionsIconTheme: IconThemeData(
    color: darkColorScheme.onBackground,
    size: _iconSize,
  ),
  titleTextStyle: TextStyle(
    fontFamily: primaryFont,
    fontSize: _titleFontSize,
    fontWeight: FontWeight.bold,
    color: darkColorScheme.onBackground,
  ),
  backgroundColor: darkColorScheme.background,
  foregroundColor: darkColorScheme.onBackground,
  shadowColor: Colors.transparent,
);
