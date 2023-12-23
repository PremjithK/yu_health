// import 'package:firebase_core/firebase_core.dart';

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
import 'package:yu_health/ui/screens/login_page/bloc/login_bloc.dart';
import 'package:yu_health/ui/screens/login_page/login_page.dart';
import 'package:yu_health/ui/screens/signup_page/bloc/signup_bloc.dart';
// import 'package:yu_health/ui/screens/login_page/login_page.dart';

void main() async {
  // sharedprefs loading
  // dotenv loading
  // // firebase loading
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
    context.read<AuthBloc>().close();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 852),
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => SignupBloc()),
          BlocProvider(create: (context) => AuthBloc()),
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
              print(user?.email ?? 'Logged out');
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
                      page: LoginPage(),
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
                      page: HomePage(),
                      transitionType: PageTransitionType.slideLeft,
                      curve: Curves.ease,
                    ),
                  );
                }
              },
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             initialData: null,
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (!snapshot.hasData) {
//                 return LoginPage();
//               }
//               return HomePage();
//             },
//           ),