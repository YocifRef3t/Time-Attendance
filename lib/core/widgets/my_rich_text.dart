import 'package:flutter/material.dart';
import '../constans/colors_constans.dart';
import '../helper/translator.dart';
import '../utls/app_fonts.dart';

class NewMyRichText extends StatelessWidget {
  const NewMyRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '${translator(context).login} ${translator(context).to} ',
        style: AppFonts.poppins(
          textStyle: const TextStyle(
            color: MyColors.myDarkBlue,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          TextSpan(
            text: 'I',
            style: AppFonts.poppins(
              textStyle: const TextStyle(
                color: MyColors.myDarkBlue,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextSpan(
            text: 'nfosas ',
            style: AppFonts.poppins(
              textStyle: const TextStyle(
                color: MyColors.myDarkBlue,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextSpan(
            text: 'HR',
            style: AppFonts.poppins(
              textStyle: const TextStyle(
                color: MyColors.myDarkBlue,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
