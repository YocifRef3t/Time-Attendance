import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/reports/data/models/loans%20request/financial_details_data_model.dart';
import 'package:time_attendance/features/reports/data/repos/loans%20request/loasns_request_repo_impl.dart';
part 'loans_request_state.dart';

class LoansRequestCubit extends Cubit<LoansRequestState> {
  LoansRequestCubit() : super(LoansRequestInitial());
  String? date;

  void pickDate({required DateTime date}) => emit(PickDate(date: date));

  Future<void> fetchFinancialDetailsData() async {
    emit(LoansRequestLoading());
    String token = GetEmployeeData().token;
    var result = await LoansRequestRepoImpl().fetchFinancialDetailsData(
      token: token,
      date: date ?? formatDate(DateTime.now(), [yyyy, '-', mm]),
    );
    result.fold(
      (failure) =>
          emit(LoansRequestFailure(errorMessage: failure.errorMessage)),
      (model) => emit(LoansRequestSuccess(model: model)),
    );
  }
}
