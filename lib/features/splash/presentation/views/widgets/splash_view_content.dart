import 'package:flutter/material.dart';

import 'sliding_animationt_subtitle.dart';
import 'sliding_animationt_title.dart';

class SplashViewContent extends StatelessWidget {
  const SplashViewContent(
      {super.key,
      required this.animationTitle,
      required this.animationSubtitle});
  final Animation<Offset> animationTitle;
  final Animation<Offset> animationSubtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SlidingAnimationTitle(
          animationTitle: animationTitle,
        ),
        SlidingAnimationSubtitle(
          animationSubtitle: animationSubtitle,
        )
      ],
    );
  }
}
