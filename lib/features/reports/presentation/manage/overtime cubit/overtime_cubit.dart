import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/reports/data/models/over%20time/over_time_model.dart';
import '../../../data/repos/over time/over_time_repo_impl.dart';
part 'overtime_state.dart';

class OvertimeCubit extends Cubit<OvertimeState> {
  OvertimeCubit() : super(OvertimeInitial());
  String? date;

  void pickDate({required DateTime date}) => emit(PickDate(date: date));

  Future<void> fetchOvertime() async {
    emit(OvertimeLoading());
    String token = GetEmployeeData().token;
    var result = await OverTimeImpl().fetchOverTime(
      token: token,
      date: date ?? formatDate(DateTime.now(), [yyyy, '-', mm]),
    );
    result.fold(
      (failure) => emit(OvertimeFailure(errorMessage: failure.errorMessage)),
      (model) => emit(OvertimeSuccess(model: model)),
    );
  }
}
