part of 'get_best_selling_cubit.dart';

@immutable
sealed class GetBestSellingState {}

final class GetBestSellingInitial extends GetBestSellingState {}

final class GetBestSellingLoading extends GetBestSellingState {}

final class GetBestSellingSuccess extends GetBestSellingState {
  final List<ProductItemModel> products;

  GetBestSellingSuccess({required this.products});
}

final class GetBestSellingFailure extends GetBestSellingState {
  final String errorMessage;

  GetBestSellingFailure({required this.errorMessage});
}
