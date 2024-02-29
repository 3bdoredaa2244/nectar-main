import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.backgroundColor = AppColors.oceanGreen,
    this.borderColor = Colors.transparent,
    this.fontColor = AppColors.magnoliaWhite,
    this.height = 67,
  });
  final void Function()? onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: borderColor)),
        child: Center(
          child: Text(
            buttonText,
            style: Styles.styleBlackRussian18.copyWith(color: fontColor),
          ),
        ),
      ),
    );
  }
}
