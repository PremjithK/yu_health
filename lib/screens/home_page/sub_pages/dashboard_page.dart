import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/screens/home_page/widgets/consult_button.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: ValueNotifier(
                FirebaseAuth.instance.currentUser!.displayName,
              ),
              builder: (context, value, _) {
                return Text('Welcome to YuCare $value!');
              },
            ),
            const Gap(10),
            const ConsultButton(),
            const Gap(15),
            Text(
              'History',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
