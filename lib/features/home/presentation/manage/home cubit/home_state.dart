part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class NotificationCounterIncreased extends HomeState {}

final class PickDate extends HomeState {
  final DateTime date;

  PickDate({required this.date});
}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final HomeModel homeModel;
  HomeSuccess({required this.homeModel});
}

final class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure({required this.errorMessage});
}
