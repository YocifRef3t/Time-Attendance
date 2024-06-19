import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/menu/presentation/manage/attendance%20history%20cubit/attendance_history_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../home/presentation/views/widgets/home view/date_filter_widget.dart';

class AttendanceMonthFilter extends StatefulWidget {
  const AttendanceMonthFilter({Key? key}) : super(key: key);

  @override
  State<AttendanceMonthFilter> createState() => _AttendanceMonthFilterState();
}

class _AttendanceMonthFilterState extends State<AttendanceMonthFilter> {
  bool isLoading = true;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceHistoryCubit, AttendanceHistoryState>(
      listener: (context, state) {
        if (state is AttendanceHistoryLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is PickDate) {
          date = state.date;
          isLoading = false;
          setState(() {});
        } else {
          isLoading = false;
          setState(() {});
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextLoading(
            isLoading: isLoading,
            text: Text(
              translator(context).attendanceHistory,
              style: AppFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: kIsWeb ? 22 : 19,
                  fontWeight: FontWeight.w500,
                  color: MyColors.myDarkBlue,
                ),
              ),
            ),
          ),
          !isLoading
              ? DateFilterWidget(
                  dWidth: kIsWeb ? 0.15 : 0.35,
                  onTap: () async {
                    await DatePicker.showDatePicker(
                      context,
                      minTime: DateTime(2022, 1),
                      maxTime: DateTime.now(),
                      currentTime: date ?? DateTime.now(),
                      locale: Intl.getCurrentLocale() == 'ar'
                          ? LocaleType.ar
                          : LocaleType.en,
                      onConfirm: (time) {
                        BlocProvider.of<AttendanceHistoryCubit>(context)
                            .pickDate(date: time);
                        BlocProvider.of<AttendanceHistoryCubit>(context).date =
                            formatDate(time, [yyyy, '-', mm]);
                        BlocProvider.of<AttendanceHistoryCubit>(context)
                            .fetchAttendanceHistory();
                      },
                    );
                  },
                  hint: date != null
                      ? formatDate(date!, [yyyy, '-', m])
                      : formatDate(DateTime.now(), [yyyy, '-', m]),
                  icon: Icons.filter_alt_outlined,
                )
              : const Spacer(),
        ],
      ),
    );
  }
}
