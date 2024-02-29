import 'package:flutter/material.dart';
import 'package:nectar/core/function/cache_network_image.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';

class TogglingProductImages extends StatelessWidget {
  const TogglingProductImages({super.key, required this.product});
  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.honeydew,
        borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(25), bottomStart: Radius.circular(25)),
      ),
      child: cachedMyNetworkImage(
          imageUrl: product.imageUrl!,
          height: 200,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.contain),
    );
  }
}
