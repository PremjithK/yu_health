// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yu_health/firebase_options.dart';
import 'package:yu_health/ui/core/config/theme.dart';
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
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => SignupBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YuHealth for patients',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: const LoginPage(),
        ),
      ),
    );
  }
}
