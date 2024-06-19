import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';

import '../../../../../core/network/location.dart';

part 'late_attendance_state.dart';

class LateAttendanceCubit extends Cubit<LateAttendanceState> {
  LateAttendanceCubit() : super(LateAttendanceInitial());

  Future<void> sendLateAttendance({
    required String date,
    required String time,
    required String eFunction,
    required String description,
  }) async {
    emit(LateAttendanceLoading());
    Position position = await GetLocation.getPosition();
    String token = GetEmployeeData().token;
    var result = await HomeRepoImpl().sendLateAttendance(
      token: token,
      date: date,
      time: time,
      eFunction: eFunction,
      description: description,
      longitude: position.longitude.toString(),
      latitude: position.latitude.toString(),
    );
    result.fold(
      (failure) =>
          emit(LateAttendanceFailure(errorMessage: failure.errorMessage)),
      (message) => emit(LateAttendanceSuccess(message: message)),
    );
  }
}
