import 'package:flutter/material.dart';

import '../../../../../../core/constans/colors_constans.dart';

customDatePicker({
  required BuildContext context,
  DateTime? firstDate,
  DateTime? initialDate,
  DateTime? lastDate,
  DateTime? currentDate,
}) {
  return showDatePicker(
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          iconTheme: const IconThemeData(
            color: MyColors.mainColor,
          ),
          primaryColor: MyColors.myWazenLight,
          dialogBackgroundColor: MyColors.myBackGroundColor,
          colorScheme: const ColorScheme.light(
              onPrimary: MyColors.myBlack,
              onSurface: MyColors.myWazenLight,
              primary: MyColors.myWazenLight // circle color
              ),
        ),
        child: child!,
      );
    },
    context: context,
    firstDate: firstDate ?? DateTime(2023),
    lastDate: lastDate ?? DateTime(2026),
    initialDate: initialDate ?? DateTime.now(),
    currentDate: currentDate ?? DateTime.now(),
  );
}
