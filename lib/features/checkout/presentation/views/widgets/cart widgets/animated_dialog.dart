import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/core/widgets/custom_button.dart';

Future<void> animatedDialog({
  required BuildContext context,
  required double width,
  String title = 'Your Order has been accepted',
  String massege =
      'Your items has been placed and is on it’s way to being processed',
  String text1 = 'Back to home',
  String text2 = 'Track Order',
  String animation = 'done',
  void Function()? onTap1,
  void Function()? onTap2,
}) =>
    Dialogs.materialDialog(
        barrierDismissible: true,
        titleAlign: TextAlign.center,
        msgAlign: TextAlign.center,
        dialogWidth: width,
        color: AppColors.white,
        msg: massege,
        title: title,
        msgStyle: Styles.styleMagnoliaWhite16
            .copyWith(color: AppColors.grey, fontWeight: FontWeight.w500),
        titleStyle: Styles.styleBlackRussian28,
        lottieBuilder: Lottie.asset(
          'assets/animations/$animation.json',
          repeat: false,
          fit: BoxFit.contain,
        ),
        context: context,
        actions: [
          CustomActionButton(
            buttonText: text1,
            fontColor: AppColors.blackRussian,
            backgroundColor: AppColors.white,
            borderColor: AppColors.grey,
            height: 45,
            onTap: onTap1,
          ),
          CustomActionButton(
            buttonText: text2,
            height: 45,
            onTap: onTap2,
          )
        ]);
