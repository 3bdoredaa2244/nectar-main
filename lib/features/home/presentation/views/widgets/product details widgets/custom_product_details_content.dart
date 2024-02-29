import 'package:flutter/material.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/widgets/custom_product_icon.dart';
import '../../../../../../core/widgets/custom_product_title_subtitle.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key, required this.product});
  final ProductItemModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomProductTitleAndSubtitle(
          title: product.title,
          type: product.type,
          size: product.size,
        ),
        CustomProductIcon(
          product: product,
        )
      ],
    );
  }
}
