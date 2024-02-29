import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class OnboardingWelcomeText extends StatelessWidget {
  const OnboardingWelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Welcome \n to our store',
              style:
                  Styles.styleWhite48.copyWith(color: AppColors.blackRussian)),
          TextSpan(
              text: '\n Get your groceries in as fast as one hour',
              style:
                  Styles.styleMagnoliaWhite16.copyWith(color: AppColors.grey))
        ]));
  }
}
