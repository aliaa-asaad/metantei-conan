import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final bool isPop;
  final Function()? onPressed;
  const CustomIconButton({
    super.key,
   required  this.icon,
    this.onPressed,
    this.isPop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.r),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 19.r,
        child: IconButton(
          onPressed: isPop ? Navigator.of(context).pop : onPressed,
          icon: isPop
              ? const Icon(Icons.arrow_back,color: Colors.white,)
              : Icon(icon,color: Colors.white,),
                  /* colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn), */
                ),
        ),
      
    );
  }
}