import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/container_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/vacations%20history%20cubit/vacations_cubit.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../data/models/vacation history/vacation_model.dart';
import 'vacation_month_widget.dart';

class VacationHistoryWidget extends StatelessWidget {
  final VacationHistoryData? model;
  const VacationHistoryWidget({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const VacationMonthWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            BlocBuilder<VacationsHistoryCubit, VacationsHistoryState>(
              builder: (context, state) {
                if (state is VacationsHistoryLoading) {
                  return const ContainerLoading(
                    height: 80,
                  );
                }
                return StaggeredGrid.count(
                  crossAxisCount: 10,
                  mainAxisSpacing: kIsWeb ? 5 : 10,
                  crossAxisSpacing: kIsWeb ? 5 : 10,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 5,
                      mainAxisCellCount: kIsWeb ? .75 : 2.5,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(232, 249, 252, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Text(
                                        translator(context).availableVacations,
                                        overflow: TextOverflow.ellipsis,
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
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      model!.availableVacations.toString(),
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
                      crossAxisCellCount: 5,
                      mainAxisCellCount: kIsWeb ? .75 : 2.5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(249, 239, 255, 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Text(
                                      translator(context).takenVacations,
                                      overflow: TextOverflow.ellipsis,
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
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    model!.vacationsTaken.toString(),
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
