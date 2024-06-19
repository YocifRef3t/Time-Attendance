import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import '../constans/colors_constans.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double width;
  final double height;
  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color = MyColors.myWazen,
      this.width = 100,
      this.height = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.myWazenLight,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: Size(width, height),
      ),
      child: Text(
        text,
        style: AppFonts.poppins(
          textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: kIsWeb ? 20 : 16),
        ),
      ),
    );
  }
}
