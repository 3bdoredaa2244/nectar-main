import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../data/models/check_email_model.dart';
import '../../../manager/reset password cubit/reset_password_cubit.dart';
import 'custom_checkbox_row.dart';

class CustomForgetPassword extends StatefulWidget {
  const CustomForgetPassword({
    super.key,
    required this.customWidget,
  });

  final CustomCheckBoxRow customWidget;

  @override
  State<CustomForgetPassword> createState() => _CustomForgetPasswordState();
}

class _CustomForgetPasswordState extends State<CustomForgetPassword> {
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) async {
        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
          _timer?.cancel();
          await EasyLoading.dismiss();
        } else if (state is ResetPasswordSuccess) {
          AppRoutes.router.pushReplacement(AppRoutes.checkEmail,
              extra: CheckEmailModel(
                  title: 'Login', bodyText: "Reset your account's password"));
          _timer?.cancel();
          await EasyLoading.dismiss();
        } else {
          _timer?.cancel();
          await EasyLoading.show(
            status: 'loading...',
            maskType: EasyLoadingMaskType.black,
          );
        }
      },
      child: GestureDetector(
        onTap: widget.customWidget.onTap,
        child: Text(
          'Forget password ?',
          style: Styles.styleMagnoliaWhite16.copyWith(
              color: AppColors.oceanGreen, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
