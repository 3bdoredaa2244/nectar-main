import 'package:flutter/material.dart';
import 'package:nectar/core/function/cache_network_image.dart';

import '../../../../../core/models/cart_item_model.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ProductsGridViewItemBody extends StatelessWidget {
  const ProductsGridViewItemBody({super.key, required this.productItem});
  final CartItemModel productItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cachedMyNetworkImage(
              imageUrl: productItem.imageUrl,
              height: 80,
              width: MediaQuery.of(context).size.width - 30,
              fit: BoxFit.fitHeight),
          /*Image.asset(
            productItem.imageUrl,
            height: 80,
            width: MediaQuery.of(context).size.width - 30,
            fit: BoxFit.fill,
          ),*/
          Text(
            productItem.title,
            style: Styles.styleMagnoliaWhite16.copyWith(
                color: AppColors.blackRussian, fontWeight: FontWeight.w700),
          ),
          Text('${productItem.size} ${productItem.type}, price',
              style: Styles.styleGrey14),
          CustomCartRow(productItem: productItem)
        ],
      ),
    );
  }
}

class CustomCartRow extends StatelessWidget {
  const CustomCartRow({
    super.key,
    required this.productItem,
  });

  final CartItemModel productItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$' '${productItem.price}',
          style: Styles.styleBlackRussian18,
        ),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: AppColors.oceanGreen,
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.add_shopping_cart_outlined,
            color: AppColors.white,
            size: 17,
          ),
        ),
      ],
    );
  }
}
