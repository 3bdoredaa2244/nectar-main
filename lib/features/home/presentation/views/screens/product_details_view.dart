import 'package:flutter/material.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../widgets/product details widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductItemModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsBody(
        product: product,
      ),
    );
  }
}
