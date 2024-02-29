import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'product_category_app_bar.dart';
import 'products_grid_view.dart';

class ProductCategoryViewBody extends StatelessWidget {
  const ProductCategoryViewBody({super.key, required this.categoryname});
  final String categoryname;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: ProductCategoryAppBar(categoryname: categoryname)),
          const Gap(
            20,
          ),
          Expanded(
              child: ProductsGridView(
            categoryName: categoryname,
          ))
        ],
      ),
    );
  }
}
