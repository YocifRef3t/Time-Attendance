import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';

part 'loans_request_state.dart';

class SendLoansRequestCubit extends Cubit<SendLoansRequestState> {
  SendLoansRequestCubit() : super(SendLoansRequestInitial());

  void changeOption(value) => emit(ChangeOption(value: value));

  Future<void> sendLoanRequest(
      {required String amount,
      required String type,
      required String description}) async {
    emit(SendLoansRequestLoading());
    String token = GetEmployeeData().token;
    var result = await HomeRepoImpl().sendLoanRequest(
      token: token,
      amount: amount,
      type: type,
      description: description,
    );
    result.fold(
      (failure) =>
          emit(SendLoansRequestFailure(errorMessage: failure.errorMessage)),
      (message) => emit(SendLoansRequestSuccess(message: message)),
    );
  }
}
