import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';

import '../../../../../../core/constans/colors_constans.dart';

class DateFilterWidget extends StatelessWidget {
  final double dWidth;
  final String hint;
  final VoidCallback onTap;
  final IconData icon;

  const DateFilterWidget(
      {super.key,
      required this.dWidth,
      required this.onTap,
      required this.hint,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * dWidth,
      child: ListTile(
        onTap: onTap,
        trailing: Icon(icon),
        iconColor: MyColors.myCyanBlue,
        title: Text(
          hint,
          style: AppFonts.poppins(
            textStyle: const TextStyle(
                color: MyColors.myDarkBlue,
                fontSize: kIsWeb ? 18 : 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
