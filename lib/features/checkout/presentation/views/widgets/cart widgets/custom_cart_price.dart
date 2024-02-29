import 'package:flutter/material.dart';
import '../../../../../../core/models/cart_item_model.dart';
import 'custom_cart_product_price.dart';

class CustomMyCartPrice extends StatelessWidget {
  const CustomMyCartPrice({
    super.key,
    required this.cart,
  });

  final CartItemModel cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCartProductPrice(cart: cart)
        //const ProductTotalPrice(), /////////////////////
      ],
    );
  }
}
