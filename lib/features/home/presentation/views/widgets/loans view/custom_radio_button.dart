import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';

import '../../../../../../core/constans/colors_constans.dart';

class CustomRadioButton extends StatelessWidget {
  final double width;
  final double value;
  final double groupValue;
  final Function(double?)? onChanged;
  final String title;
  final double? size;
  const CustomRadioButton(
      {super.key,
      required this.width,
      required this.groupValue,
      this.onChanged,
      required this.title,
      required this.value,
      this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: RadioListTile(
        title: Text(
          title,
          style: AppFonts.poppins(
            textStyle: const TextStyle(
              color: MyColors.myDarkBlue,
              fontSize: kIsWeb ? 20 : 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
