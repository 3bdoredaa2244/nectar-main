import 'package:flutter/material.dart';
import '../../../../../../core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_product_name.dart';
import 'custom_add_product_row.dart';
import 'custom_shop_card_image.dart';

class CustomShopCardBody extends StatelessWidget {
  const CustomShopCardBody({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomShopCardImage(product: product),
        CustomProductName(
          title: product.title,
        ),
        Text(
          '${product.size} ${product.type}, price',
          style: Styles.styleGrey14.copyWith(color: AppColors.grey),
        ),
        const Spacer(),
        CustomAddProductRow(
          product: product,
        ),
      ],
    );
  }
}
