import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/container_loading.dart';
import 'package:time_attendance/features/reports/data/models/over%20time/over_time_model.dart';
import 'package:time_attendance/features/reports/presentation/manage/overtime%20cubit/overtime_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import 'over_time_month_filter_widget.dart';

class OvertimeHistoryWidget extends StatefulWidget {
  final OverTimeModel? model;
  const OvertimeHistoryWidget({Key? key, required this.model})
      : super(key: key);

  @override
  State<OvertimeHistoryWidget> createState() => _OvertimeHistoryWidgetState();
}

class _OvertimeHistoryWidgetState extends State<OvertimeHistoryWidget> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OvertimeCubit, OvertimeState>(
      listener: (context, state) {
        if (state is OvertimeLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is OvertimeSuccess) {
          isLoading = false;
          setState(() {});
        } else if (state is OvertimeFailure) {
          isLoading = false;
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const NewOverTimeMonthFilterWidget(),
              BlocBuilder<OvertimeCubit, OvertimeState>(
                builder: (context, state) {
                  if (state is OvertimeLoading) {
                    return const ContainerLoading(
                      height: 150,
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: StaggeredGrid.count(
                      crossAxisCount: 9,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: kIsWeb ? 3 : 6,
                          mainAxisCellCount: kIsWeb ? 1.5 : 2.25,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromRGBO(232, 249, 252, 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          translator(context).overTimeRate,
                                          style: AppFonts.poppins(
                                            textStyle: const TextStyle(
                                              fontSize: kIsWeb ? 18 : 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                16,
                                                165,
                                                128,
                                                1,
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
                                          widget.model!.totalOverTimePrice
                                              .toString(),
                                          style: AppFonts.poppins(
                                            textStyle: const TextStyle(
                                              fontSize: kIsWeb ? 20 : 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(
                                                16,
                                                165,
                                                128,
                                                1,
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
                          crossAxisCellCount: kIsWeb ? 3 : 6,
                          mainAxisCellCount: kIsWeb ? 1.5 : 2.25,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromRGBO(249, 239, 255, 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        translator(context).overTimeNetSalary,
                                        style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: kIsWeb ? 18 : 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                              126,
                                              20,
                                              148,
                                              1,
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
                                        widget.model!.totalOverTimeSalary
                                            .toString(),
                                        style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: kIsWeb ? 20 : 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                              122,
                                              13,
                                              132,
                                              1,
                                            ),
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
                          crossAxisCellCount: 3,
                          mainAxisCellCount: kIsWeb ? 1.5 : 4.5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF0090A8),
                                  Color(0xFF00C5Bc),
                                  Color(0xFF00D9DA),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: kIsWeb
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .1
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                        child: Text(
                                          translator(context)
                                              .totalOverTimeHours,
                                          style: AppFonts.poppins(
                                            textStyle: const TextStyle(
                                              fontSize: kIsWeb ? 18 : 14,
                                              fontWeight: FontWeight.w500,
                                              color: MyColors.myWhite,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: kIsWeb
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.model!.totalOverTimeHours
                                            .toString(),
                                        style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: kIsWeb ? 28 : 24,
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.myWhite,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
