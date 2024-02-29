part of 'delete_favourite_cubit.dart';

@immutable
sealed class DeleteFavouriteState {}

final class DeleteFavouriteInitial extends DeleteFavouriteState {}

final class DeleteFavouriteLoading extends DeleteFavouriteState {}

final class DeleteFavouriteSuccess extends DeleteFavouriteState {}

final class DeleteFavouriteFailure extends DeleteFavouriteState {
  final String errorMessage;

  DeleteFavouriteFailure({required this.errorMessage});
}
