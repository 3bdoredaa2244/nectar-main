import 'package:flutter/material.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import '../../../../../../core/utils/styles.dart';

class CustomCartProductPrice extends StatelessWidget {
  const CustomCartProductPrice({
    super.key,
    required this.cart,
  });
  final CartItemModel cart;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        /*TextSpan(
            text: 'Price : ',
            style: Styles.styleBlackRussian18
                .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400)),*/
        TextSpan(
            text: r'$ ' '${cart.totalPrice}', style: Styles.styleBlackRussian18)
      ]),
    );
  }
}
