import 'package:flutter/material.dart';
import 'package:yu_health/domain/repositories/auth_repository.dart';
import 'package:yu_health/ui/screens/home_page/home_page.dart';
import 'package:yu_health/ui/screens/login_page/login_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthRepository().authState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // User is logged in, navigate to home page
          return const HomePage();
        } else {
          // User is not logged in, navigate to login page
          return const LoginPage();
        }
      },
    );
  }
}