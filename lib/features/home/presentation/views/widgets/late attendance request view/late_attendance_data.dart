import 'package:flutter/material.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';

mixin class LateAttendanceData {
  final TextEditingController noteController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;
  String? selectedItem;
  List<DropdownMenuItem<String>> getAttendanceTypeItems(BuildContext context) {
    return [
      DropdownMenuItem(
        value: 'A',
        child: Text(translator(context).attendingTheFirstPeriod),
      ),
      DropdownMenuItem(
        value: 'B',
        child: Text(translator(context).attendingTheSecondPeriod),
      ),
      DropdownMenuItem(
        value: 'C',
        child: Text(translator(context).leavingFirstPeriod),
      ),
      DropdownMenuItem(
        value: 'D',
        child: Text(translator(context).leavingSecondPeriod),
      ),
    ];
  }

  bool checkData(BuildContext context) {
    if (noteController.text == "") {
      ShowCustomSnackBar(context).warning(message: "Description is required");
      return false;
    } else if (date == null) {
      ShowCustomSnackBar(context).warning(message: "Date is required");

      return false;
    } else if (time == null) {
      ShowCustomSnackBar(context).warning(message: "Time is required");

      return false;
    } else if (selectedItem == null) {
      ShowCustomSnackBar(context)
          .warning(message: "Attendance type is required");

      return false;
    } else {
      return true;
    }
  }
}
