import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../data/models/attendance_history_model.dart';

class MonthWidgetAttendance extends StatelessWidget {
  final AttendanceHistory? model;
  const MonthWidgetAttendance({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: model!.attendanceList.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: MyColors.myBackGroundColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 10.0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: MyColors.attendanceBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // width: 80,
                            height: 40,
                            child: Center(
                              child: Text(
                                translator(context).attendanceDate,
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: MyColors.personIconColor,
                                    fontSize: kIsWeb ? 18 : 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            model!.attendanceList[index].date.toString(),
                            style: AppFonts.poppins(
                              textStyle: const TextStyle(
                                color: MyColors.myDarkBlue,
                                fontSize: kIsWeb ? 20 : 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: model!.attendanceList.length,
                )
              : Center(
                  child: Text(
                    translator(context).noData,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                        color: MyColors.myDarkBlue,
                        fontSize: kIsWeb ? 22 : 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
