part of 'permissions_cubit.dart';

@immutable
sealed class PermissionsState {}

final class PermissionsInitial extends PermissionsState {}

final class PickDate extends PermissionsState {
  final DateTime date;

  PickDate({required this.date});
}

final class PermissionsLoading extends PermissionsState {}

final class PermissionsSuccess extends PermissionsState {
  final PermissionsHistoryModel model;
  PermissionsSuccess({required this.model});
}

final class PermissionsFailure extends PermissionsState {
  final String errorMessage;

  PermissionsFailure({required this.errorMessage});
}
