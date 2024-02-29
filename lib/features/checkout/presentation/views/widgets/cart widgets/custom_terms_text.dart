import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomTermsText extends StatelessWidget {
  const CustomTermsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'By placing an order you agree to our',
              style: Styles.styleGrey14.copyWith(fontWeight: FontWeight.w600)),
          TextSpan(
              text: ' Terms And Conditions',
              style: Styles.styleGrey14.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.blackRussian),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('checkout');
                }),
        ]),
      ),
    );
  }
}
