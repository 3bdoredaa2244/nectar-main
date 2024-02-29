import 'package:flutter/material.dart';
import '../../../../core/models/cart_item_model.dart';
import 'widgets/cart widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.cartItems});
  final List<CartItemModel> cartItems;
  @override
  Widget build(BuildContext context) {
    return const CartViewBody(
      cartItems: [],
    );
  }
}
