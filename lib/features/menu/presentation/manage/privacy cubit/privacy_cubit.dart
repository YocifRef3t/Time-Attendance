import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/menu/data/repos/privacy%20repo/privacy_repo_impl.dart';

part 'privacy_state.dart';

class PrivacyCubit extends Cubit<PrivacyState> {
  PrivacyCubit() : super(PrivacyInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String password,
    required String conPassword,
  }) async {
    String token = GetEmployeeData().token;
    emit(ChangePasswordLoading());
    var result = await PrivacyRepoImpl().changePassword(
      token: token,
      currentPassword: currentPassword,
      password: password,
      conPassword: conPassword,
    );
    result.fold(
      (failure) =>
          emit(ChangePasswordFailure(errorMessage: failure.errorMessage)),
      (message) => emit(ChangePasswordSuccess(message: message)),
    );
  }
}
