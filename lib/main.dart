import 'package:detective_conan/routing/navigator.dart';
import 'package:detective_conan/routing/routes.dart';
import 'package:detective_conan/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      title: 'Detective Conan',
      theme: AppTheme().lightTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Routes.splash,
      navigatorKey: AppRoutes.navigatorState,
      navigatorObservers: [AppRoutes.routeObserver],
      scaffoldMessengerKey: AppRoutes.scaffoldState,debugShowCheckedModeBanner: false,
      
    );
  }
}
