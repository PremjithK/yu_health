import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yu_health/core/widgets/yu_bottom_navbar.dart';
import 'package:yu_health/screens/home/cubit/page_switcher_cubit.dart';
import 'package:yu_health/screens/home/sub_pages/dashboard_page/dashboard_page.dart';
import 'package:yu_health/screens/home/sub_pages/doctors_page/doctors_page.dart';
import 'package:yu_health/screens/home/sub_pages/feed_page/feed_page.dart';
import 'package:yu_health/screens/home/sub_pages/profile_page/profile_page.dart';
import 'package:yu_health/screens/search_doctors/search_doctors_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const DashboardPage(key: Key('dashboard')),
    const SearchDoctorsPage(key: Key('search_doctors')),
    const FeedPage(key: Key('feed_page')),
    const ProfilePage(key: Key('my_profile')),
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
            //? extendBody:true so the content goes under the navbar
            //? instead of leaving space for the navbar
            extendBody: true,
            bottomNavigationBar: YuNavBar(
              height: 50.h,
              width: ScreenUtil.defaultSize.width,
              destinations: [
                const NavItem(label: 'Home', icon: Icons.home),
                NavItem(
                  label: 'Doctors',
                  icon: FontAwesomeIcons.stethoscope,
                  iconSize: 18.sp,
                ),
                const NavItem(label: 'Feed', icon: Icons.newspaper),
                const NavItem(label: 'Profile', icon: Icons.person),
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
