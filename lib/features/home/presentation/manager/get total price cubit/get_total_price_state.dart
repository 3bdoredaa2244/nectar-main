part of 'get_total_price_cubit.dart';

@immutable
sealed class GetTotalPriceState {}

final class GetTotalPriceInitial extends GetTotalPriceState {}

final class GetTotalPriceLoading extends GetTotalPriceState {}

final class GetTotalPriceSuccess extends GetTotalPriceState {
  final List<CartItemModel> carts;

  GetTotalPriceSuccess({required this.carts});
}

final class GetTotalPriceFailure extends GetTotalPriceState {
  final String errorMessage;

  GetTotalPriceFailure({required this.errorMessage});
}
