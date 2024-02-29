part of 'uploud_image_cubit.dart';

@immutable
sealed class UploudImageState {}

final class UploudImageInitial extends UploudImageState {}

final class UploudImageLoading extends UploudImageState {}

final class UploudImageSuccess extends UploudImageState {
  final String myUrl;

  UploudImageSuccess({required this.myUrl});
}

final class UploudImageFailure extends UploudImageState {
  final String errorMessage;

  UploudImageFailure({required this.errorMessage});
}
