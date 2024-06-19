import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/menu/presentation/manage/attendance%20history%20cubit/attendance_history_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../reports/presentation/views/widgets/permission history view/no_internet_view.dart';
import '../../../../data/models/attendance_history_model.dart';
import 'attendance_history_widget.dart';
import 'month_widget_attendance.view.dart';

class AttendanceHistoryViewBody extends StatefulWidget {
  const AttendanceHistoryViewBody({Key? key}) : super(key: key);

  @override
  State<AttendanceHistoryViewBody> createState() =>
      _AttendanceHistoryViewBodyState();
}

class _AttendanceHistoryViewBodyState extends State<AttendanceHistoryViewBody> {
  bool isLoading = true;
  AttendanceHistory? model;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceHistoryCubit, AttendanceHistoryState>(
      listener: (context, state) {
        if (state is AttendanceHistoryLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is AttendanceHistorySuccess) {
          isLoading = false;
          model = state.model;
          setState(() {});
        } else if (state is AttendanceHistoryFailure) {
          isLoading = false;
          setState(() {});
        }
      },
      child: LiquidPullToRefresh(
        color: MyColors.myWazenLight,
        height: 80,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 300,
        onRefresh: () async {
          await BlocProvider.of<AttendanceHistoryCubit>(context)
              .fetchAttendanceHistory();
        },
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: OfflineBuilder(
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return connected
                      ? Padding(
                          padding: const EdgeInsets.all(kIsWeb ? 50 : 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AttendanceHistoryWidget(
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
                              !isLoading
                                  ? MonthWidgetAttendance(
                                      model: model!,
                                    )
                                  : SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.39,
                                      child: const ListLoading(),
                                    ),
                            ],
                          ),
                        )
                      : NoInternetScreen(
                          appBarTitle: translator(context).attendanceHistory);
                },
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
