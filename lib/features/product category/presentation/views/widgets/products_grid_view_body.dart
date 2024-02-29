import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'product_grid_view_item.dart';

class ProductGridViewBody extends StatelessWidget {
  const ProductGridViewBody({super.key, required this.products});
  final List<ProductItemModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 175 / 250,
          mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRoutes.productDetailsView, extra: products[index]);
          },
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 32.5,
              child: CustomProductGridViewItem(
                product: products[index],
              )),
        );
      },
    );
  }
}
