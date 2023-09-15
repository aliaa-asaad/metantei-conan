import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metantei_conan/features/character_details/presentation/screens/character_details_screen.dart';
import 'package:metantei_conan/features/home/data/model/all_characters_repo.dart';
import 'package:metantei_conan/features/home/data/view_model/cubit/all_characters_cubit_cubit.dart';
import 'package:metantei_conan/routing/routes.dart';

import '../features/character_details/data/view_model/cubit/character_details_cubit.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  late AllCharactersCubit charactersCubit;
  late AllCharactersRepo charactersRepository = AllCharactersRepo();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.home:
        return AppRoutes.aniamtedNavigation(
            screen: MultiBlocProvider(providers: [
              BlocProvider(
          create: (context) =>
              CharacterDetailsCubit(settings.arguments as String)),
          BlocProvider(
              create: (context) =>
                  AllCharactersCubit()..getAllCharactersCubit())
        ], child: HomeScreen()));
      /* BlocProvider(
              //1
              //دي اول طريقة باكول فيها الميثود من خلال انه هيكريت الاوبجكت اول ما اروح للاسكرين وبعدها هينفذ الميثود 
          create: (context) => AllCharactersCubit()..getAllCharactersCubit(),
          child: const HomeScreen(),
        )); */
      case Routes.characterDetails:
        return AppRoutes.aniamtedNavigation(
            screen: BlocProvider(
          create: (context) =>
              CharacterDetailsCubit(settings.arguments as String),
          child: CharacterDetailsScreen(),
        ));
      default:
        return AppRoutes.aniamtedNavigation(
            screen: const Scaffold(
          body: Center(child: Text('Error')),
        ));
    }
  }

  static aniamtedNavigation({
    required Widget screen,
  }) {
    return PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen);
  }

  static pushNamedNavigator(
      {required String routeName,
      Object? arguments,
      bool replacement = false}) {
    if (replacement) {
      navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
