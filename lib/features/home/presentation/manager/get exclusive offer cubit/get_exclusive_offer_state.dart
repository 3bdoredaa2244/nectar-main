part of 'get_exclusive_offer_cubit.dart';

@immutable
sealed class GetExclusiveOfferState {}

final class GetExclusiveOfferInitial extends GetExclusiveOfferState {}

final class GetExclusiveOfferLoading extends GetExclusiveOfferState {}

final class GetExclusiveOfferSuccess extends GetExclusiveOfferState {
  final List<ProductItemModel> products;

  GetExclusiveOfferSuccess({required this.products});
}

final class GetExclusiveOfferFailure extends GetExclusiveOfferState {
  final String errorMessage;

  GetExclusiveOfferFailure({required this.errorMessage});
}
