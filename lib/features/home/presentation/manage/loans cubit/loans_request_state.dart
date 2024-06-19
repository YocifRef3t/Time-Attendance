part of 'loans_request_cubit.dart';

@immutable
sealed class SendLoansRequestState {}

final class SendLoansRequestInitial extends SendLoansRequestState {}

final class ChangeOption extends SendLoansRequestState {
  final double value;

  ChangeOption({required this.value});
}

final class SendLoansRequestLoading extends SendLoansRequestState {}

final class SendLoansRequestSuccess extends SendLoansRequestState {
  final String message;
  SendLoansRequestSuccess({required this.message});
}

final class SendLoansRequestFailure extends SendLoansRequestState {
  final String errorMessage;

  SendLoansRequestFailure({required this.errorMessage});
}
