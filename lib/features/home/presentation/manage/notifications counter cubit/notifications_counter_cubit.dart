import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/helper/get_profile_data.dart';
import 'package:time_attendance/core/network/notifications.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';

part 'notifications_counter_state.dart';

class NotificationsCounterCubit extends Cubit<NotificationsCounterState> {
  NotificationsCounterCubit() : super(NotificationsCounterInitial());
  int get count => _calculateCounter();
  int _notificationsSum = 0;

  int _calculateCounter() {
    return _notificationsSum + notificationsCounter1;
  }

  void resetCounter() {
    notificationsCounter1 = 0;
    _notificationsSum = 0;
  }

  Future<void> getNotificationCount() async {
    int notificationsCounter = 0;
    String token = GetEmployeeData().token;
    String empId = GetProfileData().id;
    var result = await HomeRepoImpl().getNotificationCounter(
      token: token,
      empId: empId,
    );
    result.fold(
      (failure) => notificationsCounter = 0,
      (counter) => notificationsCounter = counter,
    );
    _notificationsSum = 0;
    _notificationsSum = _notificationsSum + notificationsCounter;
  }
}
