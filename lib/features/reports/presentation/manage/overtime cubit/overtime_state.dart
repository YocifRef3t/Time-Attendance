part of 'overtime_cubit.dart';

@immutable
sealed class OvertimeState {}

final class OvertimeInitial extends OvertimeState {}

final class PickDate extends OvertimeState {
  final DateTime date;

  PickDate({required this.date});
}

final class OvertimeLoading extends OvertimeState {}

final class OvertimeSuccess extends OvertimeState {
  final OverTimeModel model;
  OvertimeSuccess({required this.model});
}

final class OvertimeFailure extends OvertimeState {
  final String errorMessage;

  OvertimeFailure({required this.errorMessage});
}
