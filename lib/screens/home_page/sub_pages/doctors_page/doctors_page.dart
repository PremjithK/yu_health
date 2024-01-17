import 'package:flutter/material.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/core/utils/page_transitions.dart';
import 'package:yu_health/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/screens/search_doctors/search_doctors_page.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Doctors'),
      ),
      body: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YuElevatedButton(
              label: 'Search Doctors',
              onPressed: () {
                Navigator.push(
                  context,
                  TransitionedRoute(
                    page: const SearchDoctorsPage(),
                    transitionType: PageTransitionType.slideLeft,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
