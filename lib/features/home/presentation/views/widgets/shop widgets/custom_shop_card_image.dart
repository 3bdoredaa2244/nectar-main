import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/function/cache_network_image.dart';
import '../../../../../../core/models/product_item_model.dart';
import 'custom_product_percent_opacity.dart';

class CustomShopCardImage extends StatelessWidget {
  const CustomShopCardImage({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(17.r)),
      child: CustomShopCardImageBody(product: product),
    );
  }
}

class CustomShopCardImageBody extends StatelessWidget {
  const CustomShopCardImageBody({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cachedMyNetworkImage(
            imageUrl: product.imageUrl ??
                "https://demofree.sirv.com/nope-not-here.jpg",
            height: MediaQuery.sizeOf(context).height / 2,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fitHeight),
        PositionedDirectional(
          start: 0,
          top: 0,
          child: CustomPercentOpacity(product: product),
        )
      ],
    );
  }
}
