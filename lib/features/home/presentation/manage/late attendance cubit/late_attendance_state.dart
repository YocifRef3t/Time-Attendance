part of 'late_attendance_cubit.dart';

@immutable
sealed class LateAttendanceState {}

final class LateAttendanceInitial extends LateAttendanceState {}

final class LateAttendanceLoading extends LateAttendanceState {}

final class LateAttendanceSuccess extends LateAttendanceState {
  final String message;

  LateAttendanceSuccess({required this.message});
}

final class LateAttendanceFailure extends LateAttendanceState {
  final String errorMessage;

  LateAttendanceFailure({required this.errorMessage});
}
