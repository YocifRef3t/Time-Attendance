part of 'set_penalty_cubit.dart';

@immutable
sealed class SetPenaltyState {}

final class SetPenaltyInitial extends SetPenaltyState {}

final class SetPenaltyLoading extends SetPenaltyState {}

final class PenaltyTypeChanged extends SetPenaltyState {
  final String value;

  PenaltyTypeChanged({required this.value});
}

final class RadioButtonChanged extends SetPenaltyState {
  final double? value;
  RadioButtonChanged({required this.value});
}

final class SendPenaltyLoading extends SetPenaltyState {}

final class SetPenaltySuccess extends SetPenaltyState {
  final PenaltiesDetailsModel model;

  SetPenaltySuccess({required this.model});
}

final class SetPenaltyFailure extends SetPenaltyState {
  final String errorMessage;

  SetPenaltyFailure({required this.errorMessage});
}

final class SendPenaltySuccess extends SetPenaltyState {
  final String message;

  SendPenaltySuccess({required this.message});
}

final class SendPenaltyFailure extends SetPenaltyState {
  final String errorMessage;

  SendPenaltyFailure({required this.errorMessage});
}
