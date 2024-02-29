import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/features/profile/data/repos/image%20repo/image_repo.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit(this.imageRepo) : super(PickImageInitial());
  final ImageRepo imageRepo;
  File? file;
  String? baseName;
  pickImage() async {
    emit(PickImageLoading());
    debugPrint(
        '//////////////////////////////pick loading///////////////////////////////////////////');
    var responce = await imageRepo.pickImage();
    responce.fold((error) {
      debugPrint(
          '//////////////////////////////pick error///////////////////////////////////////////');
      emit(PickImageFailure(errorMessage: error));
    }, (image) {
      if (image != null) {
        debugPrint(
            '//////////////////////////////pick success///////////////////////////////////////////');
        file = File(image.path);
        baseName = p.basename(image.path);
        emit(PickImageSuccess());
      }
    });
  }
}
