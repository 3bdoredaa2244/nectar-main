part of 'get_favorites_cubit.dart';

@immutable
sealed class GetFavoritesState {}

final class GetFavoritesInitial extends GetFavoritesState {}

final class GetFavoritesLoading extends GetFavoritesState {}

final class GetFavoritesEmpty extends GetFavoritesState {}

final class GetFavoritesSuccess extends GetFavoritesState {
  final List<String> productsIdList;

  GetFavoritesSuccess({required this.productsIdList});
}

final class GetFavoritesFailure extends GetFavoritesState {
  final String errorMessage;

  GetFavoritesFailure({required this.errorMessage});
}
