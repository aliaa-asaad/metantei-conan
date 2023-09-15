import 'package:flutter/cupertino.dart';
import 'package:metantei_conan/routing/navigator.dart';

abstract class MediaQueryHelper {
  static double width =
      MediaQuery.of(AppRoutes.navigatorState.currentContext!).size.width;
  static double height =
      MediaQuery.of(AppRoutes.navigatorState.currentContext!).size.height;
}
