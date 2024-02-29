part of 'get_groceries_cubit.dart';

@immutable
sealed class GetGroceriesState {}

final class GetGroceriesInitial extends GetGroceriesState {}

final class GetGroceriesLoading extends GetGroceriesState {}

final class GetGroceriesSuccess extends GetGroceriesState {
  final List<ProductItemModel> products;

  GetGroceriesSuccess({required this.products});
}

final class GetGroceriesFailure extends GetGroceriesState {
  final String errorMessage;
  GetGroceriesFailure({required this.errorMessage});
}
