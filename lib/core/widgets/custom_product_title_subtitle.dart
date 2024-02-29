import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/widgets/custom_product_name.dart';
import '../utils/styles.dart';

class CustomProductTitleAndSubtitle extends StatelessWidget {
  const CustomProductTitleAndSubtitle(
      {super.key, required this.title, required this.type, required this.size});
  final String title;
  final String type;
  final num size;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 7),
            child: CustomProductName(
              title: title,
            )),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$size $type, price',
          style: Styles.styleMagnoliaWhite16.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
