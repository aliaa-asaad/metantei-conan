import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  final int currentIndex;
  final int index;
  const CustomDot({super.key, required this.currentIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    height: 6,
    width: currentIndex == index ? 25 : 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color:currentIndex == index ? Theme.of(context).colorScheme.primary:Colors.grey,
    ),
  );
  }
}