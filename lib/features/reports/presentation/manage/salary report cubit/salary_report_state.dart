part of 'salary_report_cubit.dart';

@immutable
sealed class SalaryReportState {}

final class SalaryReportInitial extends SalaryReportState {}

final class SalaryReportLoading extends SalaryReportState {}

final class SalaryReportSuccess extends SalaryReportState {
  final List<SalaryReportModel> model;

  SalaryReportSuccess({required this.model});
}

final class SalaryReportFailure extends SalaryReportState {
  final String errorMessage;

  SalaryReportFailure({required this.errorMessage});
}
