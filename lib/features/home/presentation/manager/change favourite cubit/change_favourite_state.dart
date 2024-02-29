part of 'change_favourite_cubit.dart';

@immutable
sealed class ChangeFavouriteState {}

final class ChangeFavouriteInitial extends ChangeFavouriteState {}

final class ChangeFavouriteLoading extends ChangeFavouriteState {}

final class ChangeFavouriteSuccess extends ChangeFavouriteState {}

final class ChangeFavouriteFailure extends ChangeFavouriteState {
  final String errorMessage;

  ChangeFavouriteFailure({required this.errorMessage});
}
