import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metantei_conan/features/splash/splash_screen.dart';
import 'package:metantei_conan/routing/navigator.dart';
import 'package:metantei_conan/routing/routes.dart';
import 'package:metantei_conan/utilities/theme.dart';
void main() {
  runApp(ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metantie Conan',
      theme: AppTheme().lightTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
       initialRoute: Routes.splash,
      navigatorKey: AppRoutes.navigatorState,
      navigatorObservers: [AppRoutes.routeObserver],
      scaffoldMessengerKey: AppRoutes.scaffoldState,
      
      
    );
  }
}
