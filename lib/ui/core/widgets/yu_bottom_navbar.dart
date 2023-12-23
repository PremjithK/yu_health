import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/ui/core/config/layout.dart';

class YuNavBar extends StatelessWidget {
  const YuNavBar({
    super.key,
    this.onDestinationSelected,
    required this.destinations,
    required this.selectedIndex,
    this.height,
    this.width,
    this.padding,
  });
  final List<Widget> destinations;
  final void Function(int index)? onDestinationSelected;
  final int selectedIndex;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ButtonLayout.borderRadius * 1.5),
        color: theme.background,
        border: Border.all(
          color: theme.onBackground.withOpacity(0.10),
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      width: width ?? ScreenUtil.defaultSize.width,
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: height ?? 75.h,
        //Styles
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        indicatorColor: theme.primary,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ButtonLayout.borderRadius,
          ),
        ),

        // Function
        destinations: destinations,
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.label,
    this.toolTip,
    required this.icon,
    this.iconSize,
  });
  final String label;
  final String? toolTip;
  final IconData icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return NavigationDestination(
      label: label,
      icon: Icon(
        icon,
        color: theme.onBackground,
        size: iconSize ?? 21.sp,
      ),
      selectedIcon: Icon(
        icon,
        color: theme.background,
        size: iconSize ?? 21.sp,
      ),
    );
  }
}
