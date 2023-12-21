import 'package:flutter/material.dart';
import 'package:yu_health/ui/core/config/layout.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: Column(
          children: [
            Text('Dashboard'),
          ],
        ),
      ),
    );
  }
}
