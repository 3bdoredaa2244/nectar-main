part of 'delete_all_carts_cubit.dart';

@immutable
sealed class DeleteAllCartsState {}

final class DeleteAllCartsInitial extends DeleteAllCartsState {}

final class DeleteAllCartsLoading extends DeleteAllCartsState {}

final class DeleteAllCartsSuccess extends DeleteAllCartsState {}

final class DeleteAllCartsFailure extends DeleteAllCartsState {
  final String errorMessage;

  DeleteAllCartsFailure({required this.errorMessage});
}
