import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class ProductTitleRow extends StatelessWidget {
  const ProductTitleRow({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.stylebBackRussian24,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'See all',
              style: Styles.styleMagnoliaWhite16
                  .copyWith(color: AppColors.oceanGreen),
            ),
          ),
        ],
      ),
    );
  }
}
