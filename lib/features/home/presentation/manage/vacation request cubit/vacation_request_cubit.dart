import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';

part 'vacation_request_state.dart';

class VacationRequestCubit extends Cubit<VacationRequestState> {
  VacationRequestCubit() : super(VacationRequestInitial());

  Future<void> sendVacationRequest({
    required String dateFrom,
    required String dateTo,
    required String? vacationType,
    required String? noteAr,
  }) async {
    if (!_checkDate(vacationType: vacationType, noteAr: noteAr)) return;
    emit(VacationRequestLoading());
    String token = GetEmployeeData().token;
    var result = await HomeRepoImpl().sendVacationRequest(
      token: token,
      dateFrom: dateFrom,
      dateTo: dateTo,
      noteAr: noteAr!,
      vacationType: vacationType!,
    );
    result.fold(
      (failure) =>
          emit(VacationRequestFailure(errorMessage: failure.errorMessage)),
      (message) => emit(VacationRequestSuccess(message: message)),
    );
  }

  bool _checkDate({String? vacationType, String? noteAr}) {
    if (vacationType == null) {
      if (Intl.getCurrentLocale() == 'ar') {
        emit(VacationRequestWarning(message: "نوع الاجازه مطلوب"));
      } else {
        emit(VacationRequestWarning(message: "Vacation type is required"));
      }
      return false;
    } else if (noteAr == null || noteAr == "") {
      if (Intl.getCurrentLocale() == 'ar') {
        emit(VacationRequestWarning(message: "يرجي ادخال ملاحظاتك"));
      } else {
        emit(VacationRequestWarning(message: "Please enter your notes"));
      }
      return false;
    } else {
      return true;
    }
  }
}
