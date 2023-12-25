import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/ui/core/providers/theme_provider.dart';
import 'package:yu_health/ui/core/widgets/yu_segmented_control.dart';
import 'package:yu_health/ui/screens/settings/widgets/theme_segment_item.dart';

class ThemeSwitcherTile extends StatelessWidget {
  const ThemeSwitcherTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, _) => Container(
        child: SegmentedControl(
          defaultValue: provider.themeMode.name,
          segments: {
            'light': IconSegment(
              label: 'Light',
              icon: const Icon(Icons.sunny),
              currentValue: provider.themeMode.name,
            ),
            'dark': IconSegment(
              label: 'Dark',
              icon: const Icon(Icons.mode_night),
              currentValue: provider.themeMode.name,
            ),
            'system': IconSegment(
              label: 'System',
              icon: const Icon(Icons.devices),
              currentValue: provider.themeMode.name,
            ),
          },
          onValueChanged: (value) {
            provider.setTheme(provider.getThemeFromString(value!));
          },
        ),
      ),
    );
  }
}
