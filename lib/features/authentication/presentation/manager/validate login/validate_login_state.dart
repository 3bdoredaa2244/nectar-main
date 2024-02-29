part of 'validate_login_cubit.dart';

@immutable
sealed class ValidateLoginState {}

final class ValidateLoginInitial extends ValidateLoginState {}

final class ValidateLoginChanged extends ValidateLoginState {}
