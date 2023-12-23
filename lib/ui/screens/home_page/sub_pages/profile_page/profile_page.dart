import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/screens/home_page/sub_pages/profile_page/profile_card_cubit/profile_card_cubit.dart';
import 'package:yu_health/ui/screens/home_page/widgets/profille_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!.uid;
    context.read<ProfileCardCubit>().getProfile(user!);
  }

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
            onPressed: () {},
            icon: Icon(Icons.logout_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined),
          ),
          Gap(15.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: PageLayout.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10.h),

            // Profile Preview Card
            BlocBuilder<ProfileCardCubit, ProfileCardState>(
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
          ],
        ),
      ),
    );
  }
}
