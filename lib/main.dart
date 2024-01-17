import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/config/theme.dart';
import 'package:yu_health/core/providers/date_picker_provider.dart';
import 'package:yu_health/core/providers/password_visibility_provider.dart';
import 'package:yu_health/core/providers/segmented_provider.dart';
import 'package:yu_health/core/providers/theme_provider.dart';
import 'package:yu_health/core/utils/connectivity_wrapper.dart';
import 'package:yu_health/firebase_options.dart';
import 'package:yu_health/screens/home/home_page.dart';
import 'package:yu_health/screens/login_page/bloc/login_bloc.dart';
import 'package:yu_health/screens/login_page/login_page.dart';
import 'package:yu_health/screens/signup_page/provider/signup_form_provider.dart';
import 'package:yu_health/screens/signup_page/signup_bloc/signup_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignupBloc()),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()..getTheme()),
        ChangeNotifierProvider(create: (context) => GenderPickerProvider()),
        ChangeNotifierProvider(create: (context) => ObscurePasswordProvider()),
        ChangeNotifierProvider(create: (context) => DatePickerProvider()),
        ChangeNotifierProvider(create: (context) => SignupFormProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 852),
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, _) => Consumer<ThemeProvider>(
        builder: (context, provider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YuHealth for patients',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: provider.themeMode,
          themeAnimationCurve: Curves.ease,
          themeAnimationDuration: Durations.long2,
          home: ConnectivityWrapper(
            child: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return const HomePage();
                }
                if (!snapshot.hasData) {
                  return const LoginPage();
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
