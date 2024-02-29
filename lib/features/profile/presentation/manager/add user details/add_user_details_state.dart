part of 'add_user_details_cubit.dart';

@immutable
sealed class AddUserDetailsState {}

final class AddUserDetailsInitial extends AddUserDetailsState {}

final class AddUserDetailsLoading extends AddUserDetailsState {}

final class AddUserDetailsSuccess extends AddUserDetailsState {}

final class AddUserDetailsFailure extends AddUserDetailsState {
  final String errorMessage;

  AddUserDetailsFailure({required this.errorMessage});
}
