part of 'loans_request_cubit.dart';

@immutable
sealed class LoansRequestState {}

final class LoansRequestInitial extends LoansRequestState {}

final class PickDate extends LoansRequestState {
  final DateTime date;

  PickDate({required this.date});
}

final class LoansRequestLoading extends LoansRequestState {}

final class LoansRequestSuccess extends LoansRequestState {
  final FinancialDetailsData model;
  LoansRequestSuccess({required this.model});
}

final class LoansRequestFailure extends LoansRequestState {
  final String errorMessage;

  LoansRequestFailure({required this.errorMessage});
}
