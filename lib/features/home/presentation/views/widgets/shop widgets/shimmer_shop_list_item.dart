import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import 'custom_shimmer_add.dart';
import '../../../../../../core/widgets/shimmer_skelton.dart';

class ShimmerShopListItem extends StatelessWidget {
  const ShimmerShopListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 173 / 248,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.black,
              offset: Offset(0, 6),
              blurRadius: 6,
            )
          ],
        ),
        child: const CustomShimmerListItemBody(),
      ),
    );
  }
}

class CustomShimmerListItemBody extends StatelessWidget {
  const CustomShimmerListItemBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        customSkelton(
          width: double.infinity,
          height: MediaQuery.of(context).size.width / 4,
        ),
        const SizedBox(
          height: 10,
        ),
        customSkelton(width: 50, height: 15),
        const SizedBox(
          height: 5,
        ),
        customSkelton(width: 30, height: 15),
        const Spacer(),
        const CustomShimmerAdd()
      ],
    );
  }
}
