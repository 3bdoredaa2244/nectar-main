import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/features/home/data/models/category_model.dart';
import '../../../../../../core/utils/app_routes.dart';
import 'custom_gridview_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.categoriesItems});
  final List<CategoryModel> categoriesItems;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: categoriesItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 175 / 189,
          mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.productCategory,
                extra: categoriesItems[index].categoryName);
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 32.5,
            child: GridViewItem(
              categoryItem: categoriesItems[index],
            ),
          ),
        );
      },
    );
  }
}
