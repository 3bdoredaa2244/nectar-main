import 'package:flutter/material.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomFavouriteItemTrailing extends StatelessWidget {
  const CustomFavouriteItemTrailing({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: FractionalOffset.centerLeft,
          child: Text(
            '\$' '${product.price}',
            style: Styles.styleMagnoliaWhite16.copyWith(
                color: AppColors.blackRussian, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
