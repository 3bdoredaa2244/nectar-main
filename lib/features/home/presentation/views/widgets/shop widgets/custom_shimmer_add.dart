import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_shimmer_price.dart';
import '../../../../../../core/widgets/shimmer_skelton.dart';

class CustomShimmerAdd extends StatelessWidget {
  const CustomShimmerAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomShimmerPrice(),
        customSkelton(width: 45.w, height: 45.h, borderRaduis: 17.r),
      ],
    );
  }
}
