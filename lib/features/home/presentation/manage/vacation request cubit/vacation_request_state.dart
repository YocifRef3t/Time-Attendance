part of 'vacation_request_cubit.dart';

@immutable
sealed class VacationRequestState {}

final class VacationRequestInitial extends VacationRequestState {}

final class VacationRequestLoading extends VacationRequestState {}

final class VacationRequestWarning extends VacationRequestState {
  final String message;

  VacationRequestWarning({required this.message});
}

final class VacationRequestSuccess extends VacationRequestState {
  final String message;
  VacationRequestSuccess({required this.message});
}

final class VacationRequestFailure extends VacationRequestState {
  final String errorMessage;

  VacationRequestFailure({required this.errorMessage});
}
