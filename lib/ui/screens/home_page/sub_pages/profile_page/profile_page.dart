import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/domain/repositories/auth_repository.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/core/providers/theme_provider.dart';
import 'package:yu_health/ui/core/utils/page_transitions.dart';
import 'package:yu_health/ui/core/widgets/alerts.dart';
import 'package:yu_health/ui/screens/home_page/sub_pages/profile_page/profile_card_cubit/profile_card_cubit.dart';
import 'package:yu_health/ui/screens/home_page/widgets/profille_card.dart';
import 'package:yu_health/ui/screens/login_page/login_page.dart';
import 'package:yu_health/ui/screens/settings/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!.uid;

  final hasBackButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: hasBackButton,
        titleSpacing: hasBackButton ? 0 : 20.w,
        title: const Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () {
              YuAlerts.showConfirmationAlert(
                context,
                title: 'Log Out',
                message: 'Are you sure you want to logout?',
                onConfirmed: () async {
                  await AuthRepository()
                      .logout()
                      .then((value) => Navigator.pop(context));
                },
                onDenied: () => Navigator.pop(context),
              );
            },
            icon: const Icon(Icons.logout_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  TransitionedRoute(
                    page: SettingsPage(),
                    transitionType: PageTransitionType.slideLeft,
                  ));
            },
            icon: const Icon(Icons.settings_outlined),
          ),
          Gap(15.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Preview Card
            BlocProvider(
              lazy: true,
              create: (context) => ProfileCardCubit()..getProfile(user),
              child: BlocBuilder<ProfileCardCubit, ProfileCardState>(
                builder: (context, state) {
                  if (state is ProfileCardLoading) {
                    return const ProfileCardLoadingPlaceholder();
                  }
                  if (state is ProfileCardLoaded) {
                    return ProfileCard(
                      onTap: () => print('Clicked Profile'),
                      name: '${state.firstName} ${state.lastName}',
                      email: state.email,
                      age: state.dateOfBirth,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
