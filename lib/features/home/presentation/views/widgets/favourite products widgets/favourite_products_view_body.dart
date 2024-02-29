import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'favourite_list_view.dart';

class FavouriteProductsViewBody extends StatelessWidget {
  const FavouriteProductsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Text(
            'My Favourites',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.grey,
        ),
        const Gap(7.5),
        const Expanded(
          child: FavouriteProductsListView(),
        ),
      ],
    );
  }
}
