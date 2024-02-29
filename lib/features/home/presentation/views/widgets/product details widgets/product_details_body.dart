import 'package:flutter/material.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'custom_product_details_data.dart';
import 'product_details_appbar.dart';
import 'toggling_product_image.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.product});
  final ProductItemModel product;
  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  final PageController pageController = PageController(initialPage: 0);
  bool changedIcon = false;
  late List<String> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ProductDetailsAppbar(),
        TogglingProductImages(
          product: widget.product,
        ),
        CustomProductDetailsData(
          product: widget.product,
        ),
      ],
    );
  }
}
