import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yu_health/ui/core/utils/auth_state_bloc/auth_state_bloc.dart';
import 'package:yu_health/ui/core/utils/page_transitions.dart';
import 'package:yu_health/ui/screens/home_page/home_page.dart';
import 'package:yu_health/ui/screens/login_page/login_page.dart';

class BlocAuthWrapper extends StatelessWidget {
  const BlocAuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state);
        if (state is UserLoggedOut) {
          Navigator.pushReplacement(
            context,
            TransitionedRoute(
              page: const LoginPage(),
              transitionType: PageTransitionType.slideLeft,
            ),
          );
        } else if (state is UserLoggedIn) {
          Navigator.pushReplacement(
            context,
            TransitionedRoute(
              page: const HomePage(),
              transitionType: PageTransitionType.slideLeft,
            ),
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
