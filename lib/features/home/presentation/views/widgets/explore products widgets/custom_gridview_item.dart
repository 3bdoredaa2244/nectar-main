import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/colors.dart';
import '../../../../data/models/category_model.dart';
import 'gridview_item_body.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.categoryItem});
  final CategoryModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: AppColors.babyGreen,
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
          border: Border.all(color: AppColors.grey)),
      child: GridviewItemBody(
        categoryItem: categoryItem,
      ),
    );
  }
}
