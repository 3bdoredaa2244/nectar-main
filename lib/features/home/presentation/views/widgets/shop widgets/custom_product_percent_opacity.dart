import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomPercentOpacity extends StatelessWidget {
  const CustomPercentOpacity({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: product.offerPrice > 0 ? 1 : 0,
      duration: Duration.zero,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: AppColors.lightRed,
            borderRadius: BorderRadius.circular(17.r)),
        child: Text(
          '${product.percent!.round()} %',
          style: Styles.styleGrey13.copyWith(color: AppColors.mediumRed),
        ),
      ),
    );
  }
}
