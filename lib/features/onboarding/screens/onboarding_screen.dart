import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_widgets/custom_background.dart';
import '../../../app_widgets/custom_elevated_button.dart';
import '../../../routing/navigator.dart';
import '../../../routing/routes.dart';
import '../../../utilities/images.dart';
import '../../../utilities/media_quary.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomBackground(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  Image.asset(
                    AppImages.logo,
                    height: MediaQueryHelper.height * .17,
                    width: MediaQueryHelper.width * .65,

                  ),
                  Image.asset(
                    AppImages.onBoarding1,
                    height: MediaQueryHelper.height * .35,
                  ),
                  SizedBox(height: MediaQueryHelper.height * .02),
                  Text(
                      'this application is made by a big fan of Detective Conan and provides all characters in Detective Conan with some informations about, have fun.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
            )),
            CustomElevatedButton(
                onPressed: () {
                  AppRoutes.pushNamedNavigator(routeName: Routes.home,replacement: true);
                },
                text: "Start"),
          ],
        ),
      ),
    ));
  }
}
