import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/widgets/custom_textformfield.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../data/models/category_model.dart';
import 'custom_gridview.dart';

class ExploreProductsViewBody extends StatelessWidget {
  const ExploreProductsViewBody(
      {super.key,
      required this.searchController,
      required this.categoriesItems});
  final TextEditingController searchController;
  final List<CategoryModel> categoriesItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Center(
              child: Text(
                'Find Categories',
                style: Styles.styleTimberGreen20
                    .copyWith(color: AppColors.blackRussian),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: CustomTextFormField(onChanged: (String test) {
              debugPrint(test);
            }),
          ),
          const Gap(
            20,
          ),
          Expanded(child: CustomGridView(categoriesItems: categoriesItems))
        ],
      ),
    );
  }
}
