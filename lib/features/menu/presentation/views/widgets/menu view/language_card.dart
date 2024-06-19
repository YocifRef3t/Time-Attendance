import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/app_router.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';

class LanguageCard extends StatefulWidget {
  const LanguageCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  String getLang() {
    if (Intl.getCurrentLocale() == 'ar') {
      return "Change language to English";
    } else {
      return "تغيير اللغه الي اللغه العربيه";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kChangeLanguageViewPath);
        },
        child: SizedBox(
          width: kIsWeb
              ? MediaQuery.of(context).size.width * .4
              : MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.languageIconBackGroundColor),
                width: kIsWeb ? 25 : 50,
                height: kIsWeb ? 25 : 50,
                child: const Icon(
                  Icons.language_outlined,
                  color: MyColors.languageIconColor,
                  size: kIsWeb ? 60 : 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translator(context).language,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                        color: MyColors.myDarkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: kIsWeb ? 20 : 16,
                      ),
                    ),
                  ),
                  Text(
                    getLang().toString(),
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                        color: MyColors.descColor,
                        fontWeight: FontWeight.w400,
                        fontSize: kIsWeb ? 17 : 13,
                      ),
                    ),
                  ),
                ],
              ),
              kIsWeb
                  ? const SizedBox(
                      width: 10,
                    )
                  : const Spacer(),

              const Icon(
                Icons.arrow_forward_ios,
                color: MyColors.descColor,
                size: 15,
              )
              // Switch(
              //   activeColor: MyColors.myWazenLight,
              //   onChanged: (value) {},
              //   value: true,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
