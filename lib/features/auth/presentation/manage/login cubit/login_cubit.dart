import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/auth/data/auth%20repo/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
    required String language,
  }) async {
    emit(LoginLoading());

    var result = await AuthRepoImpl().login(
      email: email,
      password: password,
      language: language,
    );
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
      (employee) => emit(LoginSuccess()),
    );
    String token = GetEmployeeData().token;
    var res = await AuthRepoImpl().fetchProfileDate(token: token);
    res.fold(
      (failure) => emit(
        FetchProfileDataFailure(errorMessage: failure.errorMessage),
      ),
      (profileData) => emit(FetchProfileDataSuccess()),
    );
  }
}
