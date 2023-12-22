import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/ui/core/config/layout.dart';
import 'package:yu_health/ui/core/providers/segmented_provider.dart';
import 'package:yu_health/ui/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/ui/core/widgets/yu_segmented_control.dart';
import 'package:yu_health/ui/core/widgets/yu_textfield.dart';

class PersonalInfoPart extends StatelessWidget {
  const PersonalInfoPart({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.pageController,
    required this.formKey,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  // dob

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageLayout.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Personal Info',
          ),
          Gap(15.h),
          YuTextField(
            hint: 'First Name',
            prefixIcon: const Icon(Icons.person_outline),
            validator: (value) => null,
            controller: firstNameController,
          ),
          Gap(10.h),
          YuTextField(
            hint: 'Last Name',
            prefixIcon: const Icon(Icons.person_outline),
            validator: (value) => null,
            controller: lastNameController,
          ),

          Gap(10.h),
          YuTextField(
            hint: 'Date Of Birth',
            prefixIcon: const Icon(Icons.date_range),
            suffixIcon: const Icon(Icons.add),
            validator: (value) => null,
            controller: TextEditingController(),
          ),
          Gap(10.h),
          Consumer<SegmentedControlProvider>(
            builder: (context, provider, _) => SegmentedControl(
              defaultValue: provider.selectedGender,
              segments: const {
                'Male': SegmentItem(label: 'Male', icon: Icons.male),
                'Female': SegmentItem(label: 'Female', icon: Icons.female),
                'Other': SegmentItem(
                    label: 'Other', icon: Icons.question_mark_outlined),
              },
              onValueChanged: (value) {
                context.read<SegmentedControlProvider>().setGender(value!);
              },
            ),
          ),
          Gap(10.h),

          // Submit button
          YuElevatedButton(
            width: 150.w,
            label: 'Next',
            direction: TextDirection.rtl,
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                print('part 1 valid');
                pageController.nextPage(
                  duration: Durations.long2,
                  curve: Curves.ease,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
