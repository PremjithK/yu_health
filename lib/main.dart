import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:yu_health/firebase_options.dart';
import 'package:yu_health/ui/core/config/theme.dart';
import 'package:yu_health/ui/core/providers/theme_provider.dart';
import 'package:yu_health/ui/core/utils/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeProvider>().getTheme();
  }

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
          home: const AuthWrapper(),
        ),
      ),
    );
  }
}
