import 'package:flutter/material.dart';
import 'shimmer_shop_list_item.dart';

class ShimmerShopListView extends StatelessWidget {
  const ShimmerShopListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsetsDirectional.only(end: 10),
            child: ShimmerShopListItem(),
          );
        },
      ),
    );
  }
}
