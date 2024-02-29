import 'package:flutter/material.dart';
import 'package:nectar/core/models/product_item_model.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomProductPrice extends StatelessWidget {
  const CustomProductPrice({
    super.key,
    required this.product,
  });
  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Price : ',
                style: Styles.styleBlackRussian18.copyWith(
                    color: AppColors.grey, fontWeight: FontWeight.w400)),
            TextSpan(
                text: r'$' '${product.price}',
                style: Styles.styleBlackRussian18)
          ]),
        ),
        secondChild: RichText(
            text: TextSpan(
                text: 'Price : ',
                style: Styles.styleBlackRussian18.copyWith(
                    color: AppColors.grey, fontWeight: FontWeight.w400),
                children: [
              TextSpan(
                text: '\$ ' '${product.offerPrice}',
                style: Styles.styleBlackRussian18,
              ),
              TextSpan(
                text: '\n \$' '${product.price}',
                style: Styles.styleBlackRussian18.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.grayHanin),
              ),
            ])),
        crossFadeState: product.offerPrice > 0
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: Duration.zero);
  }
}
