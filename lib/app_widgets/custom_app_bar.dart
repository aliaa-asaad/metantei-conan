import 'package:flutter/material.dart';
import 'package:metantei_conan/utilities/images.dart';

import '../handlers/localization.dart';
import '../utilities/media_quary.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final bool isHome;
  final String title;
  const CustomAppBar({super.key, this.isHome = false, this.title = 'home'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isHome
            ? Image.asset(
                AppImages.logo,
                height: MediaQueryHelper.height * .066,
                width: MediaQueryHelper.width * .066,
              )
            : Text(
                getLang(context, title),
                style: Theme.of(context).textTheme.titleLarge,
              ),
        const Spacer(),
        const CustomIconButton(),
      ],
    );
  }
}
