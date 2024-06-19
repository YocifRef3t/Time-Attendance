import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/vacations%20history%20cubit/vacations_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../data/models/vacation history/vacation_model.dart';
import '../permission history view/no_internet_view.dart';
import 'vacation_history_widget.dart';
import 'vacation_month_details.dart';

class VacationHistoryViewBody extends StatefulWidget {
  const VacationHistoryViewBody({Key? key}) : super(key: key);

  @override
  State<VacationHistoryViewBody> createState() =>
      _VacationHistoryViewBodyState();
}

class _VacationHistoryViewBodyState extends State<VacationHistoryViewBody> {
  bool isLoading = true;
  VacationHistoryData? model;
  @override
  Widget build(BuildContext context) {
    return BlocListener<VacationsHistoryCubit, VacationsHistoryState>(
      listener: (context, state) {
        if (state is VacationsHistoryLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is VacationsHistorySuccess) {
          isLoading = false;
          model = state.model;
          setState(() {});
        } else if (state is VacationsHistoryFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: LiquidPullToRefresh(
        color: MyColors.myWazenLight,
        height: 80,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 500,
        onRefresh: () async {
          BlocProvider.of<VacationsHistoryCubit>(context)
              .fetchVacationsHistory();
        },
        child: ListView(
          children: [
            OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;
                return connected
                    ? Container(
                        padding: const EdgeInsets.all(kIsWeb ? 50 : 0),
                        height: MediaQuery.of(context).size.height,
                        color: MyColors.myBackGroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VacationHistoryWidget(
                              model: model,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: TextLoading(
                                isLoading: isLoading,
                                text: Text(
                                  translator(context).monthDetails,
                                  style: AppFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: kIsWeb ? 22 : 18,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.myDarkBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            VacationsMonthDetailsWidget(
                              model: model,
                            )
                          ],
                        ),
                      )
                    : NoInternetScreen(
                        appBarTitle: translator(context).vacationHistory);
              },
              child: const Center(
                child: CircularProgressIndicator(
                  color: MyColors.myWazen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
