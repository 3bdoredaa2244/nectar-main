part of 'capture_photo_cubit.dart';

@immutable
sealed class CapturePhotoState {}

final class CapturePhotoInitial extends CapturePhotoState {}

final class CapturePhotoLoading extends CapturePhotoState {}

final class CapturePhotoSuccess extends CapturePhotoState {}

final class CapturePhotoFailure extends CapturePhotoState {
  final String errorMessage;

  CapturePhotoFailure({required this.errorMessage});
}
