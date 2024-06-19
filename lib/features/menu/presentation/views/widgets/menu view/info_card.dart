import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';

import '../../../../../../core/constans/colors_constans.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backGroundColor;
  final String title;
  final String desc;
  final String screen;

  const InfoCard(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.backGroundColor,
      required this.title,
      required this.desc,
      required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(screen);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    color: backGroundColor),
                width: kIsWeb ? 25 : 40,
                height: kIsWeb ? 25 : 50,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: kIsWeb ? 60 : 30,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                          color: MyColors.myDarkBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: kIsWeb ? 20 : 16),
                    ),
                  ),
                  Text(
                    desc,
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
              kIsWeb ? const SizedBox(width: 10) : const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: MyColors.descColor,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
