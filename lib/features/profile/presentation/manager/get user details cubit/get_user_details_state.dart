part of 'get_user_details_cubit.dart';

@immutable
sealed class GetUserDetailsState {}

final class GetUserDetailsInitial extends GetUserDetailsState {}

final class GetUserDetailsLoading extends GetUserDetailsState {}

final class GetUserDetailsSuccess extends GetUserDetailsState {
  final UserDetailsModel user;

  GetUserDetailsSuccess({required this.user});
}

final class GetUserDetailsFailure extends GetUserDetailsState {
  final String errorMessage;

  GetUserDetailsFailure({required this.errorMessage});
}
