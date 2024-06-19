import 'package:flutter/material.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import '../constans/colors_constans.dart';

abstract class CustomAppBar {
  static PreferredSizeWidget customAppBar(
      {required String text,
      required BuildContext context,
      String? counter,
      Widget? customIcon,
      IconData? icon,
      Function()? onPressed,
      bool? autoLeading}) {
    return AppBar(
      automaticallyImplyLeading: autoLeading ?? true,
      actions: [
        GestureDetector(
          onTap: onPressed,
          child: Center(child: customIcon ?? Icon(icon)),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      iconTheme: const IconThemeData(color: MyColors.myDarkBlue),
      backgroundColor: MyColors.myBackGroundColor,
      elevation: 0.0,
      title: Text(
        text,
        style: AppFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 20,
            color: MyColors.myDarkBlue,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
