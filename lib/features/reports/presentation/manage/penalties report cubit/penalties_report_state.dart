part of 'penalties_report_cubit.dart';

@immutable
sealed class PenaltiesReportState {}

final class PenaltiesReportInitial extends PenaltiesReportState {}

final class PenaltiesReportLoading extends PenaltiesReportState {}

final class SendGrievanceLoading extends PenaltiesReportState {}

final class SendGrievanceSuccess extends PenaltiesReportState {
  final String message;

  SendGrievanceSuccess({required this.message});
}

final class SendGrievanceFailure extends PenaltiesReportState {
  final String errorMessage;

  SendGrievanceFailure({required this.errorMessage});
}

final class PenaltiesReportSuccess extends PenaltiesReportState {
  final List<PenaltiesReportModel> models;

  PenaltiesReportSuccess({required this.models});
}

final class PenaltiesReportFailure extends PenaltiesReportState {
  final String errorMessage;

  PenaltiesReportFailure({required this.errorMessage});
}

final class PenaltiesReportWarning extends PenaltiesReportState {
  final String message;

  PenaltiesReportWarning({required this.message});
}
