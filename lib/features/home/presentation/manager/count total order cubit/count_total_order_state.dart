part of 'count_total_order_cubit.dart';

@immutable
sealed class CountTotalOrderState {}

final class CountTotalOrderInitial extends CountTotalOrderState {}

final class CountTotalOrderChanged extends CountTotalOrderState {}
