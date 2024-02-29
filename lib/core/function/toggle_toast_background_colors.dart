import 'package:flutter/material.dart';
import 'package:nectar/core/models/toast_states.dart';
import 'package:nectar/core/utils/colors.dart';

Color chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      return AppColors.oceanGreen;
    case ToastStates.warning:
      return Colors.amber;
    default:
      return Colors.red;
  }
}
