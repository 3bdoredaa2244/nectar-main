import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar/core/function/toggle_toast_background_colors.dart';
import 'package:nectar/core/models/toast_states.dart';
import 'package:nectar/core/utils/colors.dart';

void customToastText(
        {required String toastMessage, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: toastMessage,
        gravity: ToastGravity.CENTER,
        backgroundColor: chooseToastColor(state),
        fontSize: 16,
        textColor: AppColors.white,
        timeInSecForIosWeb: 3);
