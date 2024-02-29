import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/function/custom_toast_text.dart';
import '../../../../../../core/models/toast_states.dart';
import '../../../manager/capture photo cubit/capture_photo_cubit.dart';
import '../../../manager/pick image cubit/pick_image_cubit.dart';
import '../../../manager/uploud image cubit/uploud_image_cubit.dart';

customAlertDialog(BuildContext context) {
  return AlertDialog(
    elevation: 10,
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          BlocListener<PickImageCubit, PickImageState>(
            listener: (context, state) async {
              var get = BlocProvider.of<PickImageCubit>(context);
              if (state is PickImageSuccess) {
                await BlocProvider.of<UploudImageCubit>(context)
                    .uploadAndDowload(file: get.file!, baseName: get.baseName!);
              } else if (state is PickImageFailure) {
                customToastText(
                    toastMessage: 'failure pick image',
                    state: ToastStates.error);
              }
            },
            child: GestureDetector(
              onTap: () async {
                await BlocProvider.of<PickImageCubit>(context).pickImage();
                log('you are right ');
                GoRouter.of(context).pop();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.photo,
                    color: AppColors.oceanGreen,
                    size: 25,
                  ),
                  Text(
                    'pick image',
                    style: Styles.styleBlackRussian18.copyWith(
                        color: AppColors.oceanGreen,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocListener<CapturePhotoCubit, CapturePhotoState>(
            listener: (context, state) async {
              var get = BlocProvider.of<CapturePhotoCubit>(context);
              if (state is CapturePhotoSuccess) {
                await BlocProvider.of<UploudImageCubit>(context)
                    .uploadAndDowload(file: get.file!, baseName: get.baseName!);
              } else if (state is CapturePhotoFailure) {
                customToastText(
                    toastMessage: 'failure pick image',
                    state: ToastStates.error);
              }
            },
            child: GestureDetector(
              onTap: () async {
                await BlocProvider.of<CapturePhotoCubit>(context)
                    .capturePhoto();
                log('you are right ,capture  ');
                GoRouter.of(context).pop();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.photo_camera,
                    color: AppColors.oceanGreen,
                    size: 25,
                  ),
                  Text(
                    'capture photo',
                    style: Styles.styleBlackRussian18.copyWith(
                        color: AppColors.oceanGreen,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
