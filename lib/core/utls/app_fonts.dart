import 'package:flutter/widgets.dart';

abstract class AppFonts {
  static poppins({required TextStyle textStyle}) {
    return textStyle.copyWith(
      fontFamily: 'Poppins',
    );
  }
}
