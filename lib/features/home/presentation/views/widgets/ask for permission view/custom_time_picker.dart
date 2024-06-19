import 'package:flutter/material.dart';

customTimePicker({required BuildContext context}) {
  return showTimePicker(
    initialEntryMode: TimePickerEntryMode.input,
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child ?? Container(),
      );
    },
  );
}
