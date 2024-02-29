part of 'manage_navigation_cubit.dart';

@immutable
sealed class ManageNavigationState {}

final class ManageNavigationInitial extends ManageNavigationState {}

final class ManageNavigationChange extends ManageNavigationState {}
