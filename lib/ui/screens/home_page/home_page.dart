import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/ui/core/widgets/yu_bottom_navbar.dart';
import 'package:yu_health/ui/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/ui/screens/home_page/dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const DashboardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[0],
      bottomNavigationBar: YuNavBar(
        destinations: [
          NavItem(label: 'Home', icon: Icons.home),
          NavItem(label: 'Doctors', icon: Icons.medical_information),
          NavItem(label: 'Services', icon: Icons.medical_services),
          NavItem(label: 'Profile', icon: Icons.person),
        ],
        selectedIndex: 0,
        onDestinationSelected: (index) {},
        height: 50.h,
      ),
    );
  }
}
