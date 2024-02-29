import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/features/profile/data/repos/image%20repo/image_repo.dart';
part 'uploud_image_state.dart';

class UploudImageCubit extends Cubit<UploudImageState> {
  UploudImageCubit(this.imageRepo) : super(UploudImageInitial());
  final ImageRepo imageRepo;
  String? myUrl;
  uploadAndDowload({required File file, required String baseName}) async {
    emit(UploudImageLoading());
    var responce =
        await imageRepo.uploadAndDowload(file: file, baseName: baseName);
    responce.fold((failure) {
      debugPrint('//////////////////////////debug///////////////////////');
      log(failure);
      emit(UploudImageFailure(errorMessage: failure));
    }, (url) {
      myUrl = url;
      debugPrint('//////////////////////////debug///////////////////////');
      log(myUrl!);
      emit(UploudImageSuccess(myUrl: url));
    });
  }
}
