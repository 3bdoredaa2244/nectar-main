part of 'delete_cart_cubit.dart';

@immutable
sealed class DeleteCartState {}

final class DeleteCartInitial extends DeleteCartState {}

final class DeleteCartLoading extends DeleteCartState {}

final class DeleteCartSuccess extends DeleteCartState {}

final class DeleteCartFailure extends DeleteCartState {
  final String errorMessage;

  DeleteCartFailure({required this.errorMessage});
}
