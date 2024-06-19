import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import '../../../../../../core/constans/colors_constans.dart';

class RequestCardWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backGroundColor;
  final String title;
  final String screenPath;

  const RequestCardWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.backGroundColor,
      required this.title,
      required this.screenPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(screenPath);
      },
      child: SizedBox(
        width: kIsWeb ? 150 : 396,
        height: kIsWeb ? 100 : 67,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backGroundColor),
              width: kIsWeb ? 25 : 50,
              height: kIsWeb ? 20 : 50,
              child: Icon(
                icon,
                color: iconColor,
                size: kIsWeb ? 40 : 30,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: AppFonts.poppins(
                textStyle: const TextStyle(
                  color: MyColors.myDarkBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: kIsWeb ? 22 : 16,
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: MyColors.descColor,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
