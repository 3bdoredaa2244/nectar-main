import 'package:flutter/material.dart';

import 'widgets/product_category_view_body.dart';

class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductCategoryViewBody(
        categoryname: categoryName,
      ),
    );
  }
}
