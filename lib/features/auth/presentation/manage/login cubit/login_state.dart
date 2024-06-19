part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class FetchProfileDataSuccess extends LoginState {}

final class FetchProfileDataFailure extends LoginState {
  final String errorMessage;
  FetchProfileDataFailure({required this.errorMessage});
}
