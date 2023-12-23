import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/firebase_options.dart';
import 'package:yu_health/ui/core/config/theme.dart';
import 'package:yu_health/ui/core/utils/auth_state_bloc/auth_bloc.dart';
import 'package:yu_health/ui/core/utils/page_transitions.dart';
import 'package:yu_health/ui/screens/home_page/home_page.dart';
import 'package:yu_health/ui/screens/home_page/sub_pages/profile_page/profile_card_cubit/profile_card_cubit.dart';
import 'package:yu_health/ui/screens/login_page/bloc/login_bloc.dart';
import 'package:yu_health/ui/screens/login_page/login_page.dart';
import 'package:yu_health/ui/screens/signup_page/bloc/signup_bloc.dart';

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
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => SignupBloc()),
          BlocProvider(create: (context) => ProfileCardCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YuHealth for patients',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: Builder(builder: (context) {
            context.read<AuthBloc>().add(UserLoading());
            FirebaseAuth.instance.authStateChanges().listen((User? user) {
              context.read<AuthBloc>().add(
                    user != null ? UserLoggedIn() : UserLoggedOut(),
                  );
            });
            return BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedOut) {
                  Navigator.pushReplacement(
                    context,
                    PageTransitionWrapper(
                      duration: Durations.long2,
                      page: const LoginPage(),
                      transitionType: PageTransitionType.slideLeft,
                      curve: Curves.ease,
                    ),
                  );
                }
                if (state is AuthLoggedIn) {
                  Navigator.pushReplacement(
                    context,
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
            );
          }),
        ),
      ),
    );
  }
}
