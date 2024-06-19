part of 'privacy_cubit.dart';

@immutable
sealed class PrivacyState {}

final class PrivacyInitial extends PrivacyState {}

final class ChangePasswordLoading extends PrivacyState {}

final class ChangePasswordSuccess extends PrivacyState {
  final String message;

  ChangePasswordSuccess({required this.message});
}

final class ChangePasswordFailure extends PrivacyState {
  final String errorMessage;

  ChangePasswordFailure({required this.errorMessage});
}
