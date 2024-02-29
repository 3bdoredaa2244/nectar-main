import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/product_item_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../home/presentation/views/widgets/shop widgets/custom_shop_card_body.dart';

class CustomProductGridViewItem extends StatelessWidget {
  const CustomProductGridViewItem({super.key, required this.product});
  final ProductItemModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: CustomShopCardBody(product: product),
    );
  }
}
