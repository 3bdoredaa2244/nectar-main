part of 'add_cart_cubit.dart';

@immutable
sealed class AddCartState {}

final class AddCartInitial extends AddCartState {}

final class AddCartLoading extends AddCartState {}

final class AddCartSuccess extends AddCartState {}

final class AddCartFailure extends AddCartState {
  final String errorMessage;

  AddCartFailure({required this.errorMessage});
}
