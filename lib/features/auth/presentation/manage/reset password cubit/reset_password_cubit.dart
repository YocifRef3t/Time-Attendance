import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/features/auth/data/auth%20repo/auth_repo_impl.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    var result = await AuthRepoImpl().resetPassword(email: email);
    result.fold(
      (failure) =>
          emit(ResetPasswordFailure(errorMessage: failure.errorMessage)),
      (message) => emit(ResetPasswordSuccess(message: message)),
    );
  }
}
