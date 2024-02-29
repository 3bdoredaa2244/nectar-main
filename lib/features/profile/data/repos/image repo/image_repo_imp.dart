import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'image_repo.dart';

class ImageRepoImp implements ImageRepo {
  final ImagePicker picker = ImagePicker();
  final _fS = FirebaseStorage.instance;
  @override
  Future<Either<String, XFile>> capturePhoto() async {
    try {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        return right(photo);
      } else {
        return left('you closed image picker before capture any photo');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, XFile?>> pickImage() async {
    try {
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      return right(image);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> uploadAndDowload(
      {required File file, required String baseName}) async {
    try {
      final refImage = _fS.ref("profileImages").child(baseName);
      await refImage.putFile(file);
      String? url = await refImage.getDownloadURL();
      return right(url);
    } catch (e) {
      return left(e.toString());
    }
  }
}
