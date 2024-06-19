import 'package:flutter/material.dart';
import 'package:time_attendance/core/helper/translator.dart';

mixin class AskForPermissionsData {
  List<DropdownMenuItem<String>> getItems(BuildContext context) {
    return [
      DropdownMenuItem(
        value: "1",
        child: Text(translator(context).earlyExitItem),
      ),
      DropdownMenuItem(
        value: "2",
        child: Text(translator(context).lateAttendanceItem),
      ),
      DropdownMenuItem(
        value: "3",
        child: Text(translator(context).workErrandItem),
      ),
      DropdownMenuItem(
        value: "4",
        child: Text(translator(context).exitAndReturnDuringWorkingHoursItem),
      ),
      DropdownMenuItem(
        value: "5",
        child: Text(translator(context).absenseItem),
      ),
    ];
  }
}
