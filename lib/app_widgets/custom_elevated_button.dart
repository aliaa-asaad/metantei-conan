import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/media_quary.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryHelper.height * .07,
      margin: EdgeInsets.all(20.r),
      width: MediaQueryHelper.width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 4,
            textStyle: Theme.of(context).textTheme.labelMedium,
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            
          ),
          
          child: Text(text)),
    );
  }
}
