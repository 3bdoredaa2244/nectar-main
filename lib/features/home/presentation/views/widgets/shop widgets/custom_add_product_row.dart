import 'package:flutter/material.dart';

import '../../../../../../core/models/product_item_model.dart';
import 'custom_add_button.dart';
import 'custom_animated_cross_fade.dart';

class CustomAddProductRow extends StatelessWidget {
  const CustomAddProductRow({super.key, required this.product});
  final ProductItemModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPriceCrossFade(product: product),
        const CustomAddButton()
      ],
    );
  }
}
