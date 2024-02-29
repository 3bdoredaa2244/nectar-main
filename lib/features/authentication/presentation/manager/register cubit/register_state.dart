part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String successMessage;
  final User user;
  RegisterSuccess({required this.user, required this.successMessage});
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}
