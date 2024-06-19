import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/reports/data/models/penalties%20report/penalties_report_model.dart';
import 'package:time_attendance/features/reports/data/repos/penalties%20report/penalties_report_repo_impl.dart';

part 'penalties_report_state.dart';

class PenaltiesReportCubit extends Cubit<PenaltiesReportState> {
  PenaltiesReportCubit() : super(PenaltiesReportInitial());

  Future<void> fetchPenaltiesReport() async {
    emit(PenaltiesReportLoading());
    String token = GetEmployeeData().token;
    var result = await PenaltiesReportRepoImpl().fetchPenaltiesReport(
      token: token,
    );
    result.fold(
      (failure) =>
          emit(PenaltiesReportFailure(errorMessage: failure.errorMessage)),
      (models) => emit(PenaltiesReportSuccess(models: models)),
    );
  }

  Future<void> sendGrievance({
    required String id,
    required String decoration,
  }) async {
    if (decoration == "") {
      if (Intl.getCurrentLocale() == 'ar') {
        emit(PenaltiesReportWarning(message: "سبب التظلم مطلوب"));
        return;
      } else {
        emit(PenaltiesReportWarning(message: "Reject reason is required"));
        return;
      }
    }
    emit(SendGrievanceLoading());
    String token = GetEmployeeData().token;
    var result = await PenaltiesReportRepoImpl().sendGrievance(
      token: token,
      id: id,
      decoration: decoration,
    );
    result.fold(
      (failure) =>
          emit(SendGrievanceFailure(errorMessage: failure.errorMessage)),
      (message) => emit(SendGrievanceSuccess(message: message)),
    );
  }
}
