import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/container_loading.dart';
import 'package:time_attendance/features/menu/presentation/manage/attendance%20history%20cubit/attendance_history_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../data/models/attendance_history_model.dart';
import 'attendance_month_filter.dart';

class AttendanceHistoryWidget extends StatelessWidget {
  final AttendanceHistory? model;
  const AttendanceHistoryWidget({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AttendanceMonthFilter(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            BlocBuilder<AttendanceHistoryCubit, AttendanceHistoryState>(
              builder: (context, state) {
                if (state is AttendanceHistoryLoading) {
                  return const ContainerLoading(
                    height: 150,
                  );
                }
                return StaggeredGrid.count(
                  crossAxisCount: kIsWeb ? 3 : 6,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 10,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 2,
                      mainAxisCellCount: kIsWeb ? .25 : 1.5,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.attendanceBackgroundColor),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.229,
                                      child: Text(
                                        translator(context).attendanceCount,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: kIsWeb ? 12 : 10,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.personIconColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      model!.attendAndDeparture.toString(),
                                      style: AppFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: kIsWeb ? 20 : 16,
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.personIconColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 2,
                      mainAxisCellCount: kIsWeb ? .25 : 1.5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.absenceBackgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.229,
                                    child: Text(
                                      translator(context).daysAbsence,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: kIsWeb ? 16 : 10,
                                              fontWeight: FontWeight.w500,
                                              color: MyColors.absenseNum)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    model!.absenceDays.toString(),
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 20 : 16,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.absenseNum,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 2,
                      mainAxisCellCount: kIsWeb ? .5 : 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(0, 144, 168, 1),
                              Color.fromRGBO(0, 197, 188, 1),
                              Color.fromRGBO(0, 217, 218, 1),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                translator(context).workHours,
                                textAlign: TextAlign.center,
                                style: AppFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 20 : 16,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.myBackGroundColor)),
                              ),
                              Text(
                                model!.workHoursSum.toString(),
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: kIsWeb ? 24 : 20,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.myBackGroundColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 2,
                      mainAxisCellCount: kIsWeb ? .25 : 1.5,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.earlyExitBackgroundColor),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.229,
                                      child: Text(
                                        translator(context).earlyExit,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: kIsWeb ? 16 : 12,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.earlyExitTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        model!.delayDays.toString(),
                                        style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: kIsWeb ? 20 : 16,
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.earlyExitTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 2,
                      mainAxisCellCount: kIsWeb ? .25 : 1.5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.earlyArrivalBackgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.229,
                                    child: Text(
                                      translator(context).earlyArrival,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: kIsWeb ? 16 : 12,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.earlyArrivalTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    model!.earlyDepartureDays.toString(),
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 20 : 16,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.earlyArrivalTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
