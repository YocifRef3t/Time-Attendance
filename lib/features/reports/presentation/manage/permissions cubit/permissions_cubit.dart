import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/reports/data/models/permissions%20history/permissions_history_model.dart';
import 'package:time_attendance/features/reports/data/repos/permissions%20history%20repo/permissions_history_repo_impl.dart';

part 'permissions_state.dart';

class PermissionsCubit extends Cubit<PermissionsState> {
  PermissionsCubit() : super(PermissionsInitial());
  String? date;

  void picDate({required DateTime date}) => emit(PickDate(date: date));

  Future<void> fetchPermissionsHistory() async {
    emit(PermissionsLoading());
    String token = GetEmployeeData().token;
    var result = await PermissionsHistoryRepoImpl().fetchPermissionsHistory(
      token: token,
      date: date ?? formatDate(DateTime.now(), [yyyy, '-', mm]),
    );
    result.fold(
      (failure) => emit(PermissionsFailure(errorMessage: failure.errorMessage)),
      (model) => emit(PermissionsSuccess(model: model)),
    );
  }
}
