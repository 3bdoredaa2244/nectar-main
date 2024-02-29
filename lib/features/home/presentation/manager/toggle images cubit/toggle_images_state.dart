part of 'toggle_images_cubit.dart';

@immutable
sealed class ToggleImagesState {}

final class ToggleImagesInitial extends ToggleImagesState {}

final class ToggleImagesSuccess extends ToggleImagesState {}
