import 'package:flutter/material.dart';
import 'favourite_shimmer_list_item.dart';

class FavouriteShimmerListview extends StatelessWidget {
  const FavouriteShimmerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const FavouriteShimmerListItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
