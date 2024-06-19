import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/app_router.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import 'request_card_widget.dart';

class ReportViewBody extends StatelessWidget {
  const ReportViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: MyColors.myBackGroundColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: kIsWeb
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    translator(context).chooseReport,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: MyColors.myDarkBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RequestCardWidget(
                        title: translator(context).permissionsHistory,
                        icon: Icons.fact_check_outlined,
                        iconColor: MyColors.askPermBackIconColor,
                        backGroundColor: MyColors.askPermBackGroundColor,
                        screenPath: AppRouter.kPermissionsHistoryViewPath,
                      ),
                      // SizedBox(width: 12.w,),
                      RequestCardWidget(
                        title: translator(context).loansRequestSent,
                        icon: Icons.money_outlined,
                        iconColor: MyColors.attendanceIconColor,
                        backGroundColor: MyColors.attendanceIconBackGroundColor,
                        screenPath: AppRouter.kLoansRequestViewPath,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RequestCardWidget(
                        title: translator(context).vacationHistory,
                        icon: Icons.holiday_village_outlined,
                        iconColor: MyColors.personIconColor,
                        backGroundColor: MyColors.personIconBackGroundColor,
                        screenPath: AppRouter.kVacationHistoryViewPath,
                      ),
                      // SizedBox(width: 12.w,),
                      RequestCardWidget(
                        title: translator(context).overTime,
                        icon: Icons.lock_clock_outlined,
                        iconColor: MyColors.myIconColor,
                        backGroundColor: MyColors.myIconBackGroundColor,
                        screenPath: AppRouter.kOverTimeViewPath,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RequestCardWidget(
                        title: translator(context).salaryReport,
                        icon: Icons.monetization_on_outlined,
                        iconColor: MyColors.personIconColor,
                        backGroundColor: MyColors.myIconBackGroundColor,
                        screenPath: AppRouter.kSalaryReportViewPath,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Visibility(
                    visible: 5 == 1,
                    child: RequestCardWidget(
                      title: translator(context).penalties,
                      icon: Icons.card_giftcard_outlined,
                      iconColor: MyColors.privacyIconColor,
                      backGroundColor: MyColors.privacyIconBackGroundColor,
                      screenPath: AppRouter.kPenaltiesViewPath,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translator(context).chooseReport,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: MyColors.myDarkBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  RequestCardWidget(
                    title: translator(context).permissionsHistory,
                    icon: Icons.fact_check_outlined,
                    iconColor: MyColors.askPermBackIconColor,
                    backGroundColor: MyColors.askPermBackGroundColor,
                    screenPath: AppRouter.kPermissionsHistoryViewPath,
                  ),
                  const SizedBox(height: 12),
                  RequestCardWidget(
                    title: translator(context).loansRequestSent,
                    icon: Icons.money_outlined,
                    iconColor: MyColors.attendanceIconColor,
                    backGroundColor: MyColors.attendanceIconBackGroundColor,
                    screenPath: AppRouter.kLoansRequestViewPath,
                  ),
                  const SizedBox(height: 12),
                  RequestCardWidget(
                    title: translator(context).vacationHistory,
                    icon: Icons.holiday_village_outlined,
                    iconColor: MyColors.personIconColor,
                    backGroundColor: MyColors.personIconBackGroundColor,
                    screenPath: AppRouter.kVacationHistoryViewPath,
                  ),
                  const SizedBox(height: 12),
                  RequestCardWidget(
                    title: translator(context).overTime,
                    icon: Icons.lock_clock_outlined,
                    iconColor: MyColors.myIconColor,
                    backGroundColor: MyColors.myIconBackGroundColor,
                    screenPath: AppRouter.kOverTimeViewPath,
                  ),
                  const SizedBox(height: 12),
                  RequestCardWidget(
                    title: translator(context).salaryReport,
                    icon: Icons.monetization_on_outlined,
                    iconColor: MyColors.personIconColor,
                    backGroundColor: MyColors.myIconBackGroundColor,
                    screenPath: AppRouter.kSalaryReportViewPath,
                  ),
                  const SizedBox(height: 12),
                  GetEmployeeData().empType == 1
                      ? const SizedBox()
                      :
                      // MyStorage.readData('empType') == 1 ? Container() :
                      RequestCardWidget(
                          title: translator(context).penalties,
                          icon: Icons.card_giftcard_outlined,
                          iconColor: MyColors.privacyIconColor,
                          backGroundColor: MyColors.privacyIconBackGroundColor,
                          screenPath: AppRouter.kPenaltiesViewPath,
                        ),
                  const SizedBox(height: 12),
                  GetEmployeeData().empType == 1
                      ? const SizedBox()
                      :
                      // MyStorage.readData('empType') == 1 ? Container() :
                      RequestCardWidget(
                          title: translator(context).insurance,
                          icon: Icons.security,
                          iconColor: const Color(0xffcf9228),
                          backGroundColor: MyColors.privacyIconBackGroundColor,
                          screenPath: AppRouter.kInsuranceViewPath,
                        ),
                  const SizedBox(height: 12),
                  GetEmployeeData().empType == 1
                      ? const SizedBox()
                      :

                      // MyStorage.readData('empType') == 1 ? Container() :
                      RequestCardWidget(
                          title: translator(context).location,
                          icon: Icons.location_on,
                          iconColor: MyColors.privacyIconColor,
                          backGroundColor: MyColors.privacyIconBackGroundColor,
                          screenPath: AppRouter.kLocationViewPath,
                        ),
                ],
              ),
      ),
    );
  }
}
