import 'package:flutter/material.dart';
import '../../../../../core/models/cart_item_model.dart';
import '../widgets/favourite products widgets/favourite_products_view_body.dart';

class FavouriteProductsView extends StatelessWidget {
  const FavouriteProductsView({super.key, required this.cartItems});
  final List<CartItemModel> cartItems;
  @override
  Widget build(BuildContext context) {
    return const FavouriteProductsViewBody();
  }
}
