import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/screens/settings/widgets/theme_switch_setting_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    //
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: Column(
          children: [
            Gap(25.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Color Scheme',
                style: textTheme.bodyMedium,
              ),
            ),
            Gap(10.h),
            const ThemeSwitcherTile(),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}
