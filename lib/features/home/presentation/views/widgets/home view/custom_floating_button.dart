import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      fanAngle: 110,
      collapsedFabShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      expandedFabShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      type: ExpandableFabType.fan,
      childrenOffset: const Offset(20, 20),
      expandedFabSize: ExpandableFabSize.small,
      distance: GetEmployeeData().empType == 1 ? 170 : 140,
      child: const Icon(Icons.add, color: Colors.white),
      backgroundColor: MyColors.myWazenLight,
      overlayStyle: ExpandableFabOverlayStyle(blur: 5),
      closeButtonStyle: const ExpandableFabCloseButtonStyle(
        backgroundColor: MyColors.myRed,
      ),
      children: [
        Column(
          children: [
            FloatingActionButton.small(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              heroTag: "askPerm",
              tooltip: translator(context).askPerm,
              backgroundColor: MyColors.askPermBackGroundColor,
              child: const Icon(
                Icons.fact_check_outlined,
                color: MyColors.askPermBackIconColor,
              ),
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kAskForPermissionsViewPath,
                );
              },
            ),
            Text(
              translator(context).askPerm,
              style: AppFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: MyColors.askPermBackIconColor,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            FloatingActionButton.small(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              heroTag: "attendance",
              tooltip: translator(context).askLoan,
              backgroundColor: MyColors.attendanceIconBackGroundColor,
              child: const Icon(Icons.money_outlined,
                  color: MyColors.attendanceIconColor),
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kLoansViewPath,
                );
              },
            ),
            Text(
              translator(context).askLoan,
              style: AppFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: MyColors.attendanceIconColor),
              ),
            ),
          ],
        ),
        Column(
          children: [
            FloatingActionButton.small(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              heroTag: "holiday",
              tooltip: translator(context).askVacation,
              backgroundColor: MyColors.personIconBackGroundColor,
              child: const Icon(
                Icons.holiday_village_outlined,
                color: MyColors.personIconColor,
              ),
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kVacationRequestViewPath,
                );
              },
            ),
            Text(
              translator(context).askVacation,
              style: AppFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: MyColors.personIconColor,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            FloatingActionButton.small(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              heroTag: "noteAdd",
              tooltip: translator(context).askAttendance,
              backgroundColor: Colors.amber.shade100,
              child: const Icon(
                Icons.note_add_outlined,
                color: MyColors.myOrange,
              ),
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kLateAttendanceRequestViewPath,
                );
              },
            ),
            Text(
              translator(context).askAttendance,
              style: AppFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade600,
                ),
              ),
            ),
          ],
        ),
        if (GetEmployeeData().empType == 1)
          Column(
            children: [
              FloatingActionButton.small(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                tooltip: translator(context).askPenalties,
                backgroundColor: MyColors.privacyIconBackGroundColor,
                child: const Icon(
                  Icons.card_giftcard_outlined,
                  color: MyColors.privacyIconColor,
                ),
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kSetPenaltiesViewPath,
                  );
                },
              ),
              Text(
                translator(context).askPenalties,
                style: AppFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: MyColors.privacyIconColor,
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
