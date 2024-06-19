import 'package:flutter/material.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';

abstract class CustomLoadingDialog {
  static show(
      {required BuildContext context,
      required String message,
      required Widget child,
      double containerHeight = .08}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            elevation: 0,
            title: Center(
                child: Text(message,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    textAlign: TextAlign.center)),
            content: SizedBox(
                height: MediaQuery.of(context).size.height * containerHeight,
                child: Center(child: child)),
          );
        });
  }
}
