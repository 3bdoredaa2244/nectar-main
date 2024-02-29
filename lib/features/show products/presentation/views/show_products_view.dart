import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

import '../../../../core/models/cart_item_model.dart';
import 'widgets/show_products_view_body.dart';

class ShowProductsView extends StatefulWidget {
  const ShowProductsView({
    super.key,
    required this.cartItems,
  });
  final List<CartItemModel> cartItems;
  @override
  State<ShowProductsView> createState() => _ShowProductsViewState();
}

class _ShowProductsViewState extends State<ShowProductsView> {
  //final List<CartItemModel> productsItems;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Beverages',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
          centerTitle: true,
          actions: const [],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ShowProductsViewBody(
            productsItems: widget.cartItems,
          ),
        ),
      ),
    );
  }
}
