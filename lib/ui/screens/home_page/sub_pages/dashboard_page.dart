import 'package:flutter/material.dart';
import 'package:yu_health/ui/core/config/layout.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
