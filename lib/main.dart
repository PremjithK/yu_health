import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/firebase_options.dart';
import 'package:yu_health/ui/core/config/theme.dart';
import 'package:yu_health/ui/core/utils/auth_state_bloc/auth_bloc.dart';
import 'package:yu_health/ui/core/utils/page_transitions.dart';
import 'package:yu_health/ui/screens/home_page/home_page.dart';
import 'package:yu_health/ui/screens/login_page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 852),
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YuHealth for patients',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              print(state);

              if (state is AuthLoggedOut) {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  PageTransitionWrapper(
                    duration: Durations.long2,
                    page: const LoginPage(),
                    transitionType: PageTransitionType.slideLeft,
                    curve: Curves.ease,
                  ),
                );
              }
              if (state is AuthLoggedIn) {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  PageTransitionWrapper(
                    duration: Durations.long2,
                    page: const HomePage(),
                    transitionType: PageTransitionType.slideLeft,
                    curve: Curves.ease,
                  ),
                );
              }
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
