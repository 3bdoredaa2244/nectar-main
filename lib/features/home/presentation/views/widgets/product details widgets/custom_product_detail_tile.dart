import 'package:flutter/material.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomProductDetailTile extends StatelessWidget {
  const CustomProductDetailTile({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.lightGray))),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(
          'Product Detail',
          style: Styles.styleBlackRussian18,
        ),
        children: [
          Text(
            product.details ?? 'unknown',
            style: Styles.styleGrey13,
          ),
        ],
      ),
    );
  }
}
