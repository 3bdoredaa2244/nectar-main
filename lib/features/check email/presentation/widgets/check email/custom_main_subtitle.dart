import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomMainSubtitle extends StatelessWidget {
  const CustomMainSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.check,
          color: AppColors.oceanGreen,
        ),
        Text(
          'Check your Email',
          style: Styles.styleMagnoliaWhite16.copyWith(
            color: AppColors.oceanGreen,
          ),
        ),
      ],
    );
  }
}
