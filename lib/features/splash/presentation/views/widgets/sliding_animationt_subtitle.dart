import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

class SlidingAnimationSubtitle extends StatelessWidget {
  const SlidingAnimationSubtitle({super.key, required this.animationSubtitle});
  final Animation<Offset> animationSubtitle;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationSubtitle,
      child: Text('online groceries',
          style: Styles.styleGrey14.copyWith(
              color: AppColors.magnoliaWhite,
              decoration: TextDecoration.none,
              letterSpacing: 2.25)),
    );
  }
}
