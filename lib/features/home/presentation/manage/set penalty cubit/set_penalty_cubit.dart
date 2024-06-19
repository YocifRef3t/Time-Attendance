import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/home/data/models/penalties_details_model.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';
part 'set_penalty_state.dart';

class SetPenaltyCubit extends Cubit<SetPenaltyState> {
  SetPenaltyCubit() : super(SetPenaltyInitial());

  void radioButton(double? value) {
    if (value == 1) {
      radioButtonValue = value!.round().toString();
      // violationAmount = null;
      // violationStatement = null;
      // warningMessage = null;
    } else {
      radioButtonValue = value!.round().toString();

      ///.. reset violation data ..\\\
    }
    emit(RadioButtonChanged(value: value));
  }

  void penaltyTypeChange(String value) {
    penaltyType = value;
    emit(PenaltyTypeChanged(value: value));
  }

  String? radioButtonValue;
  ////*****  general Data  ******////
  String? date;
  String? empId;
  ////**************************** */
  ////*****  Penalties Data  ******////
  String? penaltyType;
  // String? violationStatement;
  // String? violationAmount;
  // String? warningMessage;
  ////**************************** */
  ////*****  Violations Data  ******////
  int? punshRepeat;
  String? punshNo;
  String? idNo;

  Future<void> fetchPenaltyDetails() async {
    emit(SetPenaltyLoading());
    String token = GetEmployeeData().token;
    var result = await HomeRepoImpl().fetchPenaltyDetails(token: token);
    result.fold(
      (failure) => emit(SetPenaltyFailure(errorMessage: failure.errorMessage)),
      (model) => emit(SetPenaltySuccess(model: model)),
    );
  }

  Future<void> sendPenalty({
    required String? empId,
    required String? decisionAt,
    required String? penaltyRsn,
    required String? penaltyAmount,
    required String? warningMsg,
  }) async {
    bool check = _checkPenaltyData(
      empId: empId,
      decisionAt: decisionAt,
      penaltyRsn: penaltyRsn,
      penaltyAmount: penaltyAmount,
      warningMsg: warningMsg,
    );
    if (check) {
      if (radioButtonValue == "2") {
        emit(SetPenaltyLoading());
        String token = GetEmployeeData().token;
        var result = await HomeRepoImpl().sendPenalty(
          token: token,
          empId: empId!,
          decisionAt: decisionAt!,
          penaltyType: penaltyType!,
          penaltyRsn: penaltyRsn!,
          penaltyAmount: penaltyAmount!,
          warningMsg: warningMsg!,
        );
        result.fold(
          (failure) =>
              emit(SendPenaltyFailure(errorMessage: failure.errorMessage)),
          (message) => emit(SendPenaltySuccess(message: message)),
        );
      }
    }
  }

  Future<void> sendViolation() async {
    if (!_checkViolationData()) return;
    emit(SendPenaltyLoading());
    String token = GetEmployeeData().token;
    var result = await HomeRepoImpl().sendViolation(
      token: token,
      empId: empId!,
      decisionAt: date!,
      punshNo: punshNo!,
      punshRepeat: punshRepeat!.toString(),
      idNo: idNo!,
    );
    result.fold(
      (failure) => emit(SendPenaltyFailure(errorMessage: failure.errorMessage)),
      (message) => emit(SendPenaltySuccess(message: message)),
    );
  }

  bool _checkPenaltyData({
    required String? empId,
    required String? decisionAt,
    required String? penaltyRsn,
    required String? penaltyAmount,
    required String? warningMsg,
  }) {
    if (empId == null || empId == "") {
      return false;
    } else if (decisionAt == null || decisionAt == "") {
      return false;
    } else if (penaltyRsn == null || penaltyRsn == "") {
      return false;
    } else if (penaltyAmount == null || penaltyAmount == "") {
      return false;
    } else if (warningMsg == null || warningMsg == "") {
      return false;
    } else {
      return true;
    }
  }

  bool _checkViolationData() {
    if (empId == null) {
      return false;
    } else if (date == null) {
      return false;
    } else if (punshRepeat == null) {
      return false;
    } else if (punshNo == null) {
      return false;
    } else if (idNo == null) {
      return false;
    } else {
      return true;
    }
  }
}
