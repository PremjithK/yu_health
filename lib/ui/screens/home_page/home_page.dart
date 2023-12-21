import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/ui/core/widgets/yu_bottom_navbar.dart';
import 'package:yu_health/ui/screens/home_page/cubit/page_switcher_cubit.dart';
import 'package:yu_health/ui/screens/home_page/dashboard_page.dart';
import 'package:yu_health/ui/screens/home_page/find_doctors_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const DashboardPage(key: Key('dashboard')),
    const FindDoctorsPage(key: Key('find_doctors')),
  ];

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageSwitcherCubit(),
      child: BlocBuilder<PageSwitcherCubit, int>(
        builder: (context, index) {
          return Scaffold(
            // Content
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _pages,
            ),

            // NavigationBar
            bottomNavigationBar: YuNavBar(
              height: 50.h,
              destinations: const [
                NavItem(label: 'Home', icon: Icons.home),
                NavItem(label: 'Doctors', icon: Icons.medical_information),
                NavItem(label: 'Services', icon: Icons.medical_services),
                NavItem(label: 'Profile', icon: Icons.person),
              ],
              selectedIndex: index,
              onDestinationSelected: (index) {
                BlocProvider.of<PageSwitcherCubit>(context).switchPage(index);
                _pageController.animateToPage(
                  index,
                  duration: Durations.long2,
                  curve: Curves.ease,
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
