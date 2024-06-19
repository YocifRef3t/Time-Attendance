import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/helper/get_profile_data.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';

import '../../../data/models/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  List<NotificationModel> notifications = [];

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    String token = GetEmployeeData().token;
    var result = await HomeRepoImpl().fetchNotifications(token: token);
    result.fold(
      (failure) =>
          emit(NotificationFailure(errorMessage: failure.errorMessage)),
      (notificationList) =>
          emit(NotificationSuccess(notifications: notificationList)),
    );
  }

  Future<void> readAllNotifications() async {
    String empId = GetProfileData().id;
    String token = GetEmployeeData().token;
    await HomeRepoImpl().readAllNotifications(token: token, empId: empId);
  }
}
