import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';

import '../../../../../../core/constans/colors_constans.dart';

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const ProfileInfoCard(
      {Key? key, required this.icon, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: kIsWeb
          ? MediaQuery.of(context).size.width * 0.4
          : MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.profileCardBackGround,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: MyColors.profileCardTitle,
            size: 30,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.poppins(
                  textStyle: const TextStyle(
                    color: MyColors.profileCardTitle,
                    fontSize: kIsWeb ? 20 : 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                desc,
                style: AppFonts.poppins(
                  textStyle: const TextStyle(
                    color: MyColors.profileCardDesc,
                    fontSize: kIsWeb ? 18 : 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
