import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';

class CustomCartIconRemove extends StatelessWidget {
  const CustomCartIconRemove({super.key, required this.removeOnPressed});
  final Function()? removeOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(17.r)),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CustomIcon(
            icon: const Icon(Icons.remove),
            size: 23,
            onPressed: removeOnPressed),
      ),
    );
  }
}
