import 'package:flutter/material.dart';
import 'cart_shimmer_list_item.dart';

class CartShimmerListview extends StatelessWidget {
  const CartShimmerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const CartShimmerListItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
