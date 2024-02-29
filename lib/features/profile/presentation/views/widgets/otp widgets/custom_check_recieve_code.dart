import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomCheckRecieveCode extends StatelessWidget {
  const CustomCheckRecieveCode({
    super.key,
    this.optionMessage = "Don't recieve any code ?   ",
    this.signType = "send again",
    this.onTap,
  });
  final String optionMessage;
  final String signType;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: [
          TextSpan(
              text: optionMessage,
              style: Styles.styleMagnoliaWhite16
                  .copyWith(color: AppColors.blackRussian)),
          TextSpan(
              text: signType,
              style: Styles.styleMagnoliaWhite16.copyWith(
                  color: AppColors.oceanGreen, fontWeight: FontWeight.w900),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ]));
  }
}
