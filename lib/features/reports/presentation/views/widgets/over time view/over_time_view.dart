import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/data/models/over%20time/over_time_model.dart';
import 'package:time_attendance/features/reports/presentation/manage/overtime%20cubit/overtime_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../permission history view/no_internet_view.dart';
import 'over_time_history_widget.dart';
import 'over_time_month_details.dart';

class OverTimeViewBody extends StatefulWidget {
  const OverTimeViewBody({Key? key}) : super(key: key);

  @override
  State<OverTimeViewBody> createState() => _OverTimeViewBodyState();
}

class _OverTimeViewBodyState extends State<OverTimeViewBody> {
  bool isLoading = true;
  OverTimeModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OvertimeCubit, OvertimeState>(
      listener: (context, state) {
        if (state is OvertimeLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is OvertimeSuccess) {
          isLoading = false;
          model = state.model;
          setState(() {});
        } else if (state is OvertimeFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: LiquidPullToRefresh(
        color: MyColors.myWazenLight,
        height: 80,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 300,
        onRefresh: () async {
          await BlocProvider.of<OvertimeCubit>(context).fetchOvertime();
        },
        child: ListView(
          children: [
            OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;
                return connected
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        color: MyColors.myBackGroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OvertimeHistoryWidget(
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
                            OverTimeMonthDetailsWidget(
                              model: model,
                            ),
                          ],
                        ),
                      )
                    : NoInternetScreen(
                        appBarTitle: translator(context).salaryReport);
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
