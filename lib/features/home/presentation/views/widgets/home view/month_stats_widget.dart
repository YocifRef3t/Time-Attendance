import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/container_loading.dart';
import 'package:time_attendance/features/home/data/models/home_model.dart';
import 'package:time_attendance/features/home/presentation/manage/home%20cubit/home_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';

class MonthStatsWidget extends StatelessWidget {
  final HomeModel? model;
  const MonthStatsWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is PickDate) {
          return const ContainerLoading(
            height: 150,
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: StaggeredGrid.count(
            crossAxisCount: kIsWeb ? 3 : 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: kIsWeb ? 1 : 3,
                mainAxisCellCount: kIsWeb ? 0.5 : 1.5,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                translator(context).hoursDelay,
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: kIsWeb ? 18 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.myDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                model!.delayHours.toString(),
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: kIsWeb ? 20 : 18,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.delayNum,
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
                crossAxisCellCount: kIsWeb ? 1 : 3,
                mainAxisCellCount: kIsWeb ? 0.5 : 1.5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.statlightRed),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              translator(context).daysAbsence,
                              style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: kIsWeb ? 18 : 16,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.myDarkBlue,
                                ),
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
                                  fontSize: kIsWeb ? 20 : 18,
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
              kIsWeb
                  ? const SizedBox()
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * .026,
                    ),
              StaggeredGridTile.count(
                crossAxisCellCount: kIsWeb ? 1 : 2,
                mainAxisCellCount: kIsWeb ? 0.5 : 2.5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.statlightblue),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          translator(context).attendanceCount,
                          maxLines: 2,
                          style: AppFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: kIsWeb ? 18 : 16,
                              fontWeight: FontWeight.w500,
                              color: MyColors.myDarkBlue,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              model!.attendAndDeparture.toString(),
                              style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: kIsWeb ? 20 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.myWazenLight,
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
          ),
        );
      },
    );
  }
}
