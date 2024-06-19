import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';
part 'ask_permission_request_state.dart';

class AskPermissionRequestCubit extends Cubit<AskPermissionRequestState> {
  AskPermissionRequestCubit() : super(AskPermissionRequestInitial());

  String? selectedItem;
  Future<void> setPermissionRequest({
    required DateTime? dateFrom,
    required DateTime? dateTo,
    required String? timeFrom,
    required String? timeTo,
    required String? noteAr,
    required String? noteEn,
    required String? typeOfPermission,
  }) async {
    emit(APRLoading());
    String token = GetEmployeeData().token;
    bool validation = _checkDate(
      dateFrom: dateFrom,
      dateTo: dateTo,
      timeFrom: timeFrom,
      timeTo: timeTo,
      noteAr: noteAr,
      noteEn: noteEn,
      typeOfPermission: typeOfPermission,
    );
    if (validation) {
      var result = await HomeRepoImpl().sendPermissionRequest(
        token: token,
        dateFrom: formatDate(dateFrom!, [yyyy, '-', mm, '-', dd]),
        dateTo: formatDate(dateTo ?? DateTime.now(), [yyyy, '-', mm, '-', dd]),
        timeFrom: timeFrom!,
        timeTo: timeTo!,
        noteAr: noteAr ?? "لا يوجد بيانات",
        noteEn: noteEn ?? "There is no data",
        typeOfPermission: typeOfPermission!,
      );
      result.fold(
        (failure) => emit(APRFailure(errorMessage: failure.errorMessage)),
        (message) => emit(APRSuccess(message: message)),
      );
    }
  }

  bool _checkDate({
    required DateTime? dateFrom,
    required DateTime? dateTo,
    required String? timeFrom,
    required String? timeTo,
    required String? noteAr,
    required String? noteEn,
    required String? typeOfPermission,
  }) {
    if (dateFrom == null) {
      if (Intl.getCurrentLocale() == "ar") {
        emit(APRFailure(errorMessage: "تاريخ البدايه مطلوب"));
      } else {
        emit(APRFailure(errorMessage: "Start date is required"));
      }
      return false;
    } else if (dateTo == null &&
        (typeOfPermission == "5" || typeOfPermission == "3")) {
      if (Intl.getCurrentLocale() == "ar") {
        emit(APRFailure(errorMessage: "تاريخ النهايه مطلوب"));
      } else {
        emit(APRFailure(errorMessage: "End date is required"));
      }
      return false;
    } else if (timeFrom == null && typeOfPermission != "5") {
      if (Intl.getCurrentLocale() == "ar") {
        emit(APRFailure(errorMessage: "توقيت البدايه مطلوب"));
      } else {
        emit(APRFailure(errorMessage: "Start time is required"));
      }
      return false;
    } else if (timeTo == null && typeOfPermission != "5") {
      if (Intl.getCurrentLocale() == "ar") {
        emit(APRFailure(errorMessage: "توقيت النهايه مطلوب"));
      } else {
        emit(APRFailure(errorMessage: "End time is required"));
      }
      return false;
    } else if (noteAr == null && Intl.getCurrentLocale() == "ar") {
      if (Intl.getCurrentLocale() == "ar") {
        emit(APRFailure(errorMessage: "يرجي ادخال الوصف"));
      }
      return false;
    } else if (noteEn == null && Intl.getCurrentLocale() == "en") {
      emit(APRFailure(errorMessage: "Description is required"));

      return false;
    } else if (typeOfPermission == null) {
      if (Intl.getCurrentLocale() == "ar") {
        emit(APRFailure(errorMessage: "نوع الاذن مطلوب"));
      } else {
        emit(APRFailure(errorMessage: "Permission type is required"));
      }
      return false;
    } else {
      return true;
    }
  }
}
