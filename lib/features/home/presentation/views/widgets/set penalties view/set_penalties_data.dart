import 'package:flutter/material.dart';
import 'package:time_attendance/core/helper/translator.dart';

import '../../../../data/models/penalties_details_model.dart';

mixin class SetPenaltiesData {
  List<DropdownMenuItem<dynamic>> getPenaltiesType(BuildContext context) {
    return [
      DropdownMenuItem(
        value: "1",
        child: Text(translator(context).deductionFromSalary),
      ),
      DropdownMenuItem(
        value: "2",
        child: Text(translator(context).verbalWarning),
      ),
      DropdownMenuItem(
        value: "3",
        child: Text(translator(context).warningMessage),
      ),
      DropdownMenuItem(
        value: "4",
        child: Text(translator(context).deprivationOfTheUpComingAnnualBonus),
      ),
      DropdownMenuItem(
        value: "5",
        child: Text(
            translator(context).noticeOfTerminationAndTerminationOfService),
      ),
    ];
  }

  List<DropdownMenuItem<dynamic>> getViolationList(
      PenaltiesDetailsModel model) {
    return model.cmpPenals!.map((e) {
      return DropdownMenuItem(
        value: e.penaltiesNo,
        child: Text(e.penaltiesDscAr!),
      );
    }).toList();
  }

  List<DropdownMenuItem<dynamic>> getPenaltyRepeat(BuildContext context) {
    return [
      DropdownMenuItem(
        value: 1,
        child: Text(translator(context).firstTime),
      ),
      DropdownMenuItem(
        value: 2,
        child: Text(translator(context).secondTime),
      ),
      DropdownMenuItem(
        value: 3,
        child: Text(translator(context).thirdTime),
      ),
      DropdownMenuItem(
        value: 4,
        child: Text(translator(context).forthTime),
      ),
    ];
  }

  String? getPenaltiesTypeValue(
      PenaltiesDetailsModel model, int violationItem) {
    return model.cmpPenals!
        .firstWhere((element) {
          return element.penaltiesNo == violationItem;
        })
        .details!
        .firstWhere((element) {
          if (element.penaltiesNo == violationItem) {
            return true;
          } else {
            return false;
          }
        })
        .penaltiesDscAr
        .toString();
  }
}
