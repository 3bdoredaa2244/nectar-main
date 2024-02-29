import 'package:flutter/material.dart';
import 'package:nectar/features/show%20products/presentation/views/widgets/custom_gridview_item.dart';

import '../../../../../core/models/cart_item_model.dart';

class CustomProductsGridview extends StatelessWidget {
  const CustomProductsGridview({super.key, required this.productsItems});
  final List<CartItemModel> productsItems;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: productsItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 175 / 250,
          mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 32.5,
            child: CustomGridViewItem(
              productItem: productsItems[index],
            ));
      },
    );
  }
}
