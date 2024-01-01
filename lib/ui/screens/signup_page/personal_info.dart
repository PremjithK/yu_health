import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/ui/core/providers/date_picker_provider.dart';
import 'package:yu_health/ui/core/providers/segmented_provider.dart';
import 'package:yu_health/core/utils/validators.dart';
import 'package:yu_health/ui/core/widgets/yu_elevated_button.dart';
import 'package:yu_health/ui/core/widgets/yu_segmented_control.dart';
import 'package:yu_health/ui/core/widgets/yu_textfield.dart';
import 'package:yu_health/ui/screens/signup_page/provider/signup_form_provider.dart';

class PersonalInfoPart extends StatelessWidget {
  const PersonalInfoPart({super.key});

  @override
  Widget build(BuildContext context) {
    final signupProvider = context.read<SignupFormProvider>();
    return Padding(
      padding: PageLayout.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Personal Info',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Gap(10.h),
          YuTextField(
            hint: 'First Name',
            prefixIcon: const Icon(Icons.person_outline),
            validator: (value) => Validators.validateName(value),
            controller: signupProvider.firstNameController,
          ),
          Gap(10.h),
          YuTextField(
            hint: 'Last Name',
            prefixIcon: const Icon(Icons.person_outline),
            validator: (value) => Validators.validateName(value),
            controller: signupProvider.lastNameController,
          ),

          Gap(10.h),
          YuTextField(
            onTap: () async {
              context.read<DatePickerProvider>().setDate(
                    await _showDatePicker(context) ?? DateTime(2000),
                  );
            },
            hint: 'Date Of Birth',
            prefixIcon: const Icon(Icons.date_range),
            validator: (value) => null,
            readOnly: true,
            controller: context.read<DatePickerProvider>().dateTimeController,
          ),
          Gap(10.h),
          Consumer<GenderPickerProvider>(
            builder: (context, provider, _) => SegmentedControl(
              defaultValue: provider.selectedGender,
              segments: const {
                'Male': SegmentItem(label: 'Male', icon: Icons.male),
                'Female': SegmentItem(label: 'Female', icon: Icons.female),
                'Other': SegmentItem(
                    label: 'Other', icon: Icons.question_mark_outlined),
              },
              onValueChanged: (value) {
                context.read<GenderPickerProvider>().setGender(value!);
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
              if (signupProvider.signupFormKey.currentState!.validate()) {
                print('part 1 valid');
                signupProvider.pageController.nextPage(
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

_showDatePicker(BuildContext context) async {
  return await showDatePicker(
    context: context,
    firstDate: DateTime(1900),
    lastDate: DateTime(2500),
    initialDate: DateTime(2000),
  );
}
