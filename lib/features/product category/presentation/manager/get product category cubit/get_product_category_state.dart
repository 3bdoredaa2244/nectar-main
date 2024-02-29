part of 'get_product_category_cubit.dart';

@immutable
sealed class GetProductCategoryState {}

final class GetProductCategoryInitial extends GetProductCategoryState {}

final class GetProductCategoryLoading extends GetProductCategoryState {}

final class GetProductCategoryEmpty extends GetProductCategoryState {}

final class GetProductCategorySuccess extends GetProductCategoryState {
  final List<ProductItemModel> products;

  GetProductCategorySuccess({required this.products});
}

final class GetProductCategoryFailure extends GetProductCategoryState {
  final String errorMessage;

  GetProductCategoryFailure({required this.errorMessage});
}
