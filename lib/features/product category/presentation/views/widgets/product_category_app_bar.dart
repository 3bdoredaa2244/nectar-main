import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';

class ProductCategoryAppBar extends StatelessWidget {
  const ProductCategoryAppBar({
    super.key,
    required this.categoryname,
  });

  final String categoryname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          icon: const Icon(
            FontAwesomeIcons.angleLeft,
            color: AppColors.blackRussian,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        Gap(MediaQuery.sizeOf(context).width * .2),
        Text(
          categoryname,
          style:
              Styles.styleTimberGreen20.copyWith(color: AppColors.blackRussian),
        ),
      ],
    );
  }
}
