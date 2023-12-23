import 'package:flutter/material.dart';
import 'package:yu_health/ui/core/config/layout.dart';

class FindDoctorsPage extends StatelessWidget {
  const FindDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find A Doctor'),
      ),
      body: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
