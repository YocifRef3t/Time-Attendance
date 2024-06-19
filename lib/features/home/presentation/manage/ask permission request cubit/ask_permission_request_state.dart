part of 'ask_permission_request_cubit.dart';

@immutable
sealed class AskPermissionRequestState {}

final class AskPermissionRequestInitial extends AskPermissionRequestState {}

final class APRLoading extends AskPermissionRequestState {}

final class APRSuccess extends AskPermissionRequestState {
  final String message;

  APRSuccess({required this.message});
}

final class APRFailure extends AskPermissionRequestState {
  final String errorMessage;

  APRFailure({required this.errorMessage});
}
