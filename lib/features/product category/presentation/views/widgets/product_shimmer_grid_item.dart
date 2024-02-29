import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/core/widgets/shimmer_skelton.dart';

class CustomShimmerGridItem extends StatelessWidget {
  const CustomShimmerGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        customSkelton(
            width: MediaQuery.sizeOf(context).width,
            height: 100,
            borderRaduis: 12),
        const Gap(5),
        customSkelton(width: 35, height: 15, borderRaduis: 8),
        const Gap(5),
        customSkelton(width: 30, height: 15, borderRaduis: 8),
        const Spacer(),
        const CustomShimmerPrice()
      ],
    );
  }
}

class CustomShimmerPrice extends StatelessWidget {
  const CustomShimmerPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customSkelton(width: 15, height: 10, borderRaduis: 8),
        customSkelton(width: 25, height: 25, borderRaduis: 12),
      ],
    );
  }
}
