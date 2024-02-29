import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:nectar/core/utils/colors.dart';
import 'custom_shop_card_body.dart';

class CustomShopCard extends StatelessWidget {
  const CustomShopCard({super.key, required this.product});
  final ProductItemModel product;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 173 / 248,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: CustomShopCardBody(product: product),
      ),
    );
  }
}
