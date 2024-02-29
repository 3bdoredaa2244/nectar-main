import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/function/cache_network_image.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'custom_favourite_item_trailing.dart';

class FavouriteProductsListViewItem extends StatelessWidget {
  const FavouriteProductsListViewItem({
    super.key,
    required this.deleteItem,
    required this.product,
    this.onPressed,
  });
  final Function deleteItem;
  final ProductItemModel product;
  final dynamic Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRoutes.productDetailsView, extra: product);
        },
        child: SizedBox(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomListTile(product: product),
                const Divider(
                  color: AppColors.grey,
                  height: 1,
                  //thickness: 1,
                ),
              ],
            )),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      titleAlignment: ListTileTitleAlignment.top,
      leading: cachedMyNetworkImage(
          imageUrl:
              product.imageUrl ?? "https://demofree.sirv.com/nope-not-here.jpg",
          height: 70,
          width: 70,
          fit: BoxFit.fitHeight),
      title: Text(
        product.title,
        style: Styles.styleMagnoliaWhite16.copyWith(
            color: AppColors.blackRussian, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        '${product.size} ${product.type}, price',
        style: Styles.styleGrey14,
      ),
      trailing: CustomFavouriteItemTrailing(
        product: product,
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
