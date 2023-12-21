import 'package:flutter/material.dart';
import 'package:yu_health/ui/core/config/layout.dart';

class FindDoctorsPage extends StatefulWidget {
  const FindDoctorsPage({super.key});

  @override
  State<FindDoctorsPage> createState() => _FindDoctorsPageState();
}

class _FindDoctorsPageState extends State<FindDoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: PageLayout.pagePadding,
        child: Column(
          children: [
            Text('Doctors'),
          ],
        ),
      ),
    );
  }
}
