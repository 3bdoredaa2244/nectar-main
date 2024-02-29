import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class SlidingAnimationLogo extends StatelessWidget {
  const SlidingAnimationLogo({super.key, required this.animationLogo});
  final Animation<Offset> animationLogo;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationLogo,
      child: Image.asset(
        splashLogo,
        width: 60,
        height: 60,
        fit: BoxFit.fill,
      ),
    );
  }
}
