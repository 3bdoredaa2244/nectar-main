import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/features/product%20category/presentation/views/widgets/product_shimmer_grid_item.dart';

class CustomShimmerGridView extends StatelessWidget {
  const CustomShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 175 / 250,
          mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            width: MediaQuery.of(context).size.width / 2 - 32.5,
            decoration: BoxDecoration(
                color: AppColors.honeydew,
                borderRadius: BorderRadius.circular(17)),
            child: const CustomShimmerGridItem());
      },
    );
  }
}
