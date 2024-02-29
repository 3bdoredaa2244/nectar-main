import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 25,
      endIndent: 25,
      color: AppColors.lightGray,
    );
  }
}
