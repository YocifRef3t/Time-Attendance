import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/menu/data/repos/attendance%20history%20repo/attendance_history_repo_impl.dart';
import '../../../data/models/attendance_history_model.dart';
part 'attendance_history_state.dart';

class AttendanceHistoryCubit extends Cubit<AttendanceHistoryState> {
  AttendanceHistoryCubit() : super(AttendanceHistoryInitial());

  String? date;
  void pickDate({required DateTime date}) => emit(PickDate(date: date));

  Future<void> fetchAttendanceHistory() async {
    emit(AttendanceHistoryLoading());
    String token = GetEmployeeData().token;
    var result = await AttendanceHistoryRepoImpl().fetchAttendanceHistory(
      token: token,
      date: date ?? formatDate(DateTime.now(), [yyyy, '-', mm]),
    );
    result.fold(
      (failure) =>
          emit(AttendanceHistoryFailure(errorMessage: failure.errorMessage)),
      (model) => emit(AttendanceHistorySuccess(model: model)),
    );
  }
}
