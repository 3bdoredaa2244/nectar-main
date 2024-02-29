import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/colors.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
          color: AppColors.oceanGreen,
          borderRadius: BorderRadius.circular(17.r)),
      child: Icon(
        Icons.add,
        color: AppColors.white,
        size: 17.r,
      ),
    );
  }
}
