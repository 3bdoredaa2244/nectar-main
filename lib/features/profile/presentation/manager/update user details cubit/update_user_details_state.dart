part of 'update_user_details_cubit.dart';

@immutable
sealed class UpdateUserDetailsState {}

final class UpdateUserDetailsInitial extends UpdateUserDetailsState {}

final class UpdateUserDetailsLoading extends UpdateUserDetailsState {}

final class UpdateUserDetailsSuccess extends UpdateUserDetailsState {}

final class UpdateUserDetailsFailure extends UpdateUserDetailsState {
  final String errorMessage;

  UpdateUserDetailsFailure({required this.errorMessage});
}
