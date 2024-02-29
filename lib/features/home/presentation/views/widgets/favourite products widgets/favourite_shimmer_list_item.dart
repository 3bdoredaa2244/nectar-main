import 'package:flutter/material.dart';
import 'package:nectar/core/widgets/shimmer_skelton.dart';

import '../../../../../../core/utils/colors.dart';

class FavouriteShimmerListItem extends StatelessWidget {
  const FavouriteShimmerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: AppColors.honeydew,
              borderRadius: BorderRadius.circular(17)),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomShimmerListTile(),
              Divider(
                color: AppColors.grey,
                height: 1,
                //thickness: 1,
              ),
            ],
          )),
    );
  }
}

class CustomShimmerListTile extends StatelessWidget {
  const CustomShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      titleAlignment: ListTileTitleAlignment.top,
      leading: customSkelton(width: 70, height: 70, borderRaduis: 12),
      title: customSkelton(width: 35, height: 15),
      subtitle: customSkelton(width: 50, height: 15),
      trailing: customSkelton(width: 25, height: 15),
      contentPadding: EdgeInsets.zero,
    );
  }
}
