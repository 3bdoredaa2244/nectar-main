part of 'get_customer_id_cubit.dart';

@immutable
sealed class GetCustomerIdState {}

final class GetCustomerIdInitial extends GetCustomerIdState {}

final class GetCustomerIdLoading extends GetCustomerIdState {}

final class GetCustomerIdSuccess extends GetCustomerIdState {
  final CustomerModel customer;

  GetCustomerIdSuccess({required this.customer});
}

final class GetCustomerIdFailure extends GetCustomerIdState {
  final String errorMessage;

  GetCustomerIdFailure({required this.errorMessage});
}
