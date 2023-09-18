import 'package:detective_conan/app_widgets/custom_background.dart';
import 'package:detective_conan/routing/navigator.dart';
import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../utilities/images.dart';
import '../../utilities/media_quary.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    splashAnimation();
  }

// function that controls animation of logo
  void splashAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
          const Duration(seconds: 3),
          () => AppRoutes.pushNamedNavigator(
              routeName: Routes.onboarding, replacement: true)),
      builder: (context, _) => Scaffold(
        body: CustomBackground(
          child: Center(
            child: FadeTransition(
              opacity: animation,
              child: Image.asset(
                AppImages.logo,
                height: MediaQueryHelper.height * .3,
                width: MediaQueryHelper.width * .65,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
