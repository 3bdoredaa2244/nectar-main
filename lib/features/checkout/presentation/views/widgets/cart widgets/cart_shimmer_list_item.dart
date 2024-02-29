import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'custom_shimmer_item_body.dart';

class CartShimmerListItem extends StatelessWidget {
  const CartShimmerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17), color: AppColors.honeydew),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: CustomShimmerItemBody(),
      ),
    );
  }
}
