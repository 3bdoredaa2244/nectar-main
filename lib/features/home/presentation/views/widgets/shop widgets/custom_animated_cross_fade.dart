import 'package:flutter/material.dart';

import '../../../../../../core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomPriceCrossFade extends StatelessWidget {
  const CustomPriceCrossFade({
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
              text: '\$ ${product.offerPrice}',
              style: Styles.styleBlackRussian18),
          TextSpan(
            text: '\n   ${product.price}',
            style: Styles.styleBlackRussian18.copyWith(
                decoration: TextDecoration.lineThrough, color: AppColors.grey),
          ),
        ])),
        secondChild: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '\$ ${product.price}', style: Styles.styleBlackRussian18),
        ])),
        crossFadeState: product.offerPrice > 0
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration.zero);
  }
}
