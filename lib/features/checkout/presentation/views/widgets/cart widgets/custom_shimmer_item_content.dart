import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/core/widgets/shimmer_skelton.dart';

class CustomShimmerItemContent extends StatelessWidget {
  const CustomShimmerItemContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [CustomShimmerName(), Spacer(), CustomShimmerCountItem()],
      ),
    );
  }
}

class CustomShimmerName extends StatelessWidget {
  const CustomShimmerName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        customSkelton(width: 35, height: 15),
        const Gap(
          5,
        ),
        customSkelton(width: 50, height: 15),
      ],
    );
  }
}

class CustomShimmerCountItem extends StatelessWidget {
  const CustomShimmerCountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customSkelton(width: 20, height: 20),
        const Gap(
          10,
        ),
        Center(
          child: customSkelton(width: 5, height: 15),
        ),
        const SizedBox(
          width: 10,
        ),
        customSkelton(width: 20, height: 20),
        const Spacer(),
        customSkelton(width: 7.5, height: 15),
      ],
    );
  }
}
