import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/core/widgets/yu_banner_dash_item.dart';
import 'package:yu_health/core/widgets/yu_dash_grid_item.dart';

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
            DashBannerItem(
              onTap: () {},
              icon: const Icon(Icons.medical_information),
              title: 'Search Doctors',
            ),
            Gap(20.h),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10.h,
                mainAxisSpacing: 10.w,
              ),
              children: [
                DashGridItem(
                  onTap: () {},
                  label: 'ENT',
                  icon: const Icon(Icons.earbuds),
                ),
                const DashGridItem(
                  label: 'Cardio',
                  icon: Icon(Icons.five_g),
                ),
                const DashGridItem(
                  label: 'Ortho',
                  icon: Icon(Icons.five_g),
                ),
                const DashGridItem(
                  label: 'General',
                  icon: Icon(Icons.five_g),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
