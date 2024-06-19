import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/reports/data/repos/vacation%20history/vacation_repo_impl.dart';

import '../../../data/models/vacation history/vacation_model.dart';

part 'vacations_state.dart';

class VacationsHistoryCubit extends Cubit<VacationsHistoryState> {
  VacationsHistoryCubit() : super(VacationsInitial());
  String? date;
  void pickDate({required DateTime date}) => emit(PickDate(date: date));

  Future<void> fetchVacationsHistory() async {
    emit(VacationsHistoryLoading());
    String token = GetEmployeeData().token;
    var result = await VacationRepoImpl().fetchVacationsHistory(
      token: token,
      date: date ?? formatDate(DateTime.now(), [yyyy, '-', mm]),
    );
    result.fold(
      (failure) =>
          emit(VacationsHistoryFailure(errorMessage: failure.errorMessage)),
      (model) => emit(VacationsHistorySuccess(model: model)),
    );
  }
}
