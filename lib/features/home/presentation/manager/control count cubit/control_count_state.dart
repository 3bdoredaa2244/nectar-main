part of 'control_count_cubit.dart';

@immutable
sealed class ControlCountState {}

final class ControlCountInitial extends ControlCountState {}

final class ControlCountIncrement extends ControlCountState {}

final class ControlCountDecrement extends ControlCountState {}
