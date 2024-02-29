part of 'get_favourite_products_cubit.dart';

@immutable
sealed class GetFavouriteProductsState {}

final class GetFavouriteProductsInitial extends GetFavouriteProductsState {}

final class GetFavouriteProductsLoading extends GetFavouriteProductsState {}

final class GetFavouriteProductsSuccess extends GetFavouriteProductsState {
  final List<ProductItemModel> products;

  GetFavouriteProductsSuccess({required this.products});
}

final class GetFavouriteProductsFailure extends GetFavouriteProductsState {
  final String errorMessage;

  GetFavouriteProductsFailure({required this.errorMessage});
}
