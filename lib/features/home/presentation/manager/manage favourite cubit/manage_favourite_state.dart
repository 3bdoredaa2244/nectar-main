part of 'manage_favourite_cubit.dart';

@immutable
sealed class ManageFavouriteState {}

final class ManageFavouriteInitial extends ManageFavouriteState {}

final class ManageFavouriteLoading extends ManageFavouriteState {}

final class ManageFavouriteSuccess extends ManageFavouriteState {}

final class ManageFavouriteFailure extends ManageFavouriteState {
  final String errorMessage;

  ManageFavouriteFailure({required this.errorMessage});
}

final class ManageFavouriteChanged extends ManageFavouriteState {}
