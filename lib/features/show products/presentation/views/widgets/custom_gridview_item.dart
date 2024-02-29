import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/cart_item_model.dart';

import '../../../../../core/utils/colors.dart';
import 'grid_view_item_body.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, required this.productItem});
  final CartItemModel productItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
          border: Border.all(color: AppColors.lightGray)),
      child: ProductsGridViewItemBody(
        productItem: productItem,
      ),
    );
  }
}
