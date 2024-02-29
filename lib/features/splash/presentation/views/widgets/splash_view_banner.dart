import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sliding_animationt_logo.dart';
import 'splash_view_content.dart';

class SplashViewBanner extends StatelessWidget {
  const SplashViewBanner(
      {super.key,
      required this.logoAnimation,
      required this.titleAnimation,
      required this.subtitleAnimation});
  final Animation<Offset> logoAnimation;
  final Animation<Offset> titleAnimation;
  final Animation<Offset> subtitleAnimation;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 73.w,
        ),
        SlidingAnimationLogo(
          animationLogo: logoAnimation,
        ),
        SizedBox(
          width: 20.w,
        ),
        SplashViewContent(
          animationTitle: titleAnimation,
          animationSubtitle: subtitleAnimation,
        ),
      ],
    );
  }
}
