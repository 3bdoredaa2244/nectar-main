import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/image repo/image_repo.dart';
part 'capture_photo_state.dart';

class CapturePhotoCubit extends Cubit<CapturePhotoState> {
  CapturePhotoCubit(this.imageRepo) : super(CapturePhotoInitial());
  final ImageRepo imageRepo;
  File? file;
  String? baseName;
  capturePhoto() async {
    emit(CapturePhotoLoading());
    var responce = await imageRepo.capturePhoto();
    responce.fold((error) {
      emit(CapturePhotoFailure(errorMessage: error));
    }, (photo) {
      file = File(photo.path);
      baseName = p.basename(photo.path);
      emit(CapturePhotoSuccess());
    });
  }
}
