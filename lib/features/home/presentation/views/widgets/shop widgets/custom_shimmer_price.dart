import 'package:flutter/material.dart';

import '../../../../../../core/widgets/shimmer_skelton.dart';

class CustomShimmerPrice extends StatelessWidget {
  const CustomShimmerPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customSkelton(width: 30, height: 10),
        const SizedBox(
          height: 10,
        ),
        customSkelton(width: 30, height: 10),
      ],
    );
  }
}
