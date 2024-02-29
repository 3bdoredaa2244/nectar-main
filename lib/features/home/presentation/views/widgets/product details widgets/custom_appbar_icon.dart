import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/colors.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  CustomIcon(
      {super.key,
      this.onPressed,
      required this.icon,
      this.size,
      this.iconColor});
  Function()? onPressed = () {};
  Widget icon;
  double? size = 19.w;
  Color? iconColor = AppColors.blackRussian;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: iconColor, iconSize: size, onPressed: onPressed, icon: icon);
  }
}
