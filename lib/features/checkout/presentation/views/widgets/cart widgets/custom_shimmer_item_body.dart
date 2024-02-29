import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/widgets/shimmer_skelton.dart';
import 'custom_shimmer_item_content.dart';

class CustomShimmerItemBody extends StatelessWidget {
  const CustomShimmerItemBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customSkelton(width: 70, height: 70, borderRaduis: 12),
        const Gap(
          20,
        ),
        const CustomShimmerItemContent(),
      ],
    );
  }
}
