import 'package:flutter/material.dart';
import 'package:time_attendance/core/helper/translator.dart';

mixin VacationRequestData {
  List<DropdownMenuItem<String?>> getItems(BuildContext context) {
    return [
      DropdownMenuItem(
        value: '1',
        child: Text(translator(context).annualItem),
      ),
      DropdownMenuItem(
        value: '2',
        child: Text(translator(context).urgentItem),
      ),
      DropdownMenuItem(
        value: '3',
        child: Text(translator(context).sickLeaveItem),
      ),
      DropdownMenuItem(
        value: '4',
        child: Text(translator(context).exceptionalItem),
      ),
      DropdownMenuItem(
        value: '5',
        child: Text(translator(context).withoutSalaryItem),
      ),
      DropdownMenuItem(
        value: '6',
        child: Text(translator(context).maternityLeaveItem),
      ),
      DropdownMenuItem(
        value: '7',
        child: Text(translator(context).vacationBirthsItem),
      ),
      DropdownMenuItem(
        value: '8',
        child: Text(translator(context).deathLeaveItem),
      ),
    ];
  }
}
