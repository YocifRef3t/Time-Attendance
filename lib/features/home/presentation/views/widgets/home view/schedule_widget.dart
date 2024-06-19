import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/features/home/data/models/home_model.dart';
import 'package:time_attendance/features/home/presentation/manage/home%20cubit/home_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';

class ScheduleWidget extends StatelessWidget {
  final HomeModel? model;
  const ScheduleWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is PickDate) {
          return const ListLoading();
        }
        return model!.vacations!.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: model!.vacations!.length,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .08,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      color: MyColors.myWazenLight,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                        color: MyColors.profileCardBackGround,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              model!.vacations![index].daysCount.toString(),
                              style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: kIsWeb ? 22 : 20,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.myWazenLight,
                                ),
                              ),
                            ),
                            Text(
                              translator(context).days,
                              style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: kIsWeb ? 16 : 14,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.scheduleDayColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .08,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model!.vacations![index].vacationType,
                              style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: kIsWeb ? 16 : 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.scheduleDayColor,
                                ),
                              ),
                            ),
                            // SizedBox(height:height(context)*.0 ,),
                            Text(
                              model!.vacations![index].dateFrom,
                              style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: kIsWeb ? 16 : 14,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.profileCardDesc)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  translator(context).noSchedule,
                  style: AppFonts.poppins(
                    textStyle: const TextStyle(
                      color: MyColors.myDarkBlue,
                      fontSize: kIsWeb ? 18 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
