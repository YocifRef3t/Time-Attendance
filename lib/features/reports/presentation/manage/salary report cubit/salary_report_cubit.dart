import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/reports/data/models/salary%20report/salary_report_model.dart';
import 'package:time_attendance/features/reports/data/repos/salary%20repo/salary_report_repo_impl.dart';

part 'salary_report_state.dart';

class SalaryReportCubit extends Cubit<SalaryReportState> {
  SalaryReportCubit() : super(SalaryReportInitial());

  Map<int, String> mothConverter = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
  };

  Future<void> fetchSalaryReport() async {
    emit(SalaryReportLoading());
    String token = GetEmployeeData().token;
    var result = await SalaryRepoImpl().fetchSalaryReport(token: token);
    result.fold(
      (failure) =>
          emit(SalaryReportFailure(errorMessage: failure.errorMessage)),
      (models) => emit(SalaryReportSuccess(model: models)),
    );
  }
}
