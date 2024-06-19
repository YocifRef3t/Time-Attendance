part of 'attendance_history_cubit.dart';

@immutable
sealed class AttendanceHistoryState {}

final class AttendanceHistoryInitial extends AttendanceHistoryState {}

final class PickDate extends AttendanceHistoryState {
  final DateTime date;

  PickDate({required this.date});
}

final class AttendanceHistoryLoading extends AttendanceHistoryState {}

final class AttendanceHistorySuccess extends AttendanceHistoryState {
  final AttendanceHistory model;

  AttendanceHistorySuccess({required this.model});
}

final class AttendanceHistoryFailure extends AttendanceHistoryState {
  final String errorMessage;

  AttendanceHistoryFailure({required this.errorMessage});
}
