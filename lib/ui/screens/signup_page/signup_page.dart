import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/ui/core/providers/password_visibility_provider.dart';
import 'package:yu_health/ui/core/providers/segmented_provider.dart';
import 'package:yu_health/ui/screens/signup_page/credentials.dart';
import 'package:yu_health/ui/screens/signup_page/personal_info.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // Image holder

  // Page
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SegmentedControlProvider()),
        ChangeNotifierProvider(create: (context) => ObscurePasswordProvider()),
      ],
      builder: (context, _) => Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500.h,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {},
                  controller: _pageController,
                  children: [
                    PersonalInfoPart(
                      formKey: _formKey,
                      pageController: _pageController,
                      firstNameController: _firstNameController,
                      lastNameController: _lastNameController,
                      phoneController: _phoneController,
                    ),
                    CredentialsPart(
                      formKey: _formKey,
                      pageController: _pageController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
