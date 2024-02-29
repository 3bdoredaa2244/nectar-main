import 'package:flutter/material.dart';

import '../../../../../core/models/cart_item_model.dart';
import 'custom_products_gridview.dart';

class ShowProductsViewBody extends StatelessWidget {
  const ShowProductsViewBody({super.key, required this.productsItems});
  final List<CartItemModel> productsItems;
  @override
  Widget build(BuildContext context) {
    return CustomProductsGridview(
      productsItems: productsItems,
    );
  }
}
