import 'package:flutter/material.dart';
import 'package:nectar/core/utils/styles.dart';

class SlidingAnimationTitle extends StatelessWidget {
  const SlidingAnimationTitle({super.key, required this.animationTitle});
  final Animation<Offset> animationTitle;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationTitle,
      child: Text(
        'nectar',
        style: Styles.styleWhite48.copyWith(
            fontWeight: FontWeight.w700, decoration: TextDecoration.none),
      ),
    );
  }
}
