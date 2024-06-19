part of 'vacations_cubit.dart';

@immutable
sealed class VacationsHistoryState {}

final class VacationsInitial extends VacationsHistoryState {}

final class PickDate extends VacationsHistoryState {
  final DateTime date;

  PickDate({required this.date});
}

final class VacationsHistoryLoading extends VacationsHistoryState {}

final class VacationsHistorySuccess extends VacationsHistoryState {
  final VacationHistoryData model;

  VacationsHistorySuccess({required this.model});
}

final class VacationsHistoryFailure extends VacationsHistoryState {
  final String errorMessage;

  VacationsHistoryFailure({required this.errorMessage});
}
