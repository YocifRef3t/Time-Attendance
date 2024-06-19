import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/vacations%20history%20cubit/vacations_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../home/presentation/views/widgets/home view/date_filter_widget.dart';

class VacationMonthWidget extends StatefulWidget {
  const VacationMonthWidget({Key? key}) : super(key: key);

  @override
  State<VacationMonthWidget> createState() => _VacationMonthWidgetState();
}

class _VacationMonthWidgetState extends State<VacationMonthWidget> {
  DateTime? date;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<VacationsHistoryCubit, VacationsHistoryState>(
      listener: (context, state) {
        if (state is VacationsHistoryLoading) {
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
              translator(context).vacationHistory,
              style: AppFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: MyColors.myDarkBlue,
                ),
              ),
            ),
          ),
          !isLoading
              ? DateFilterWidget(
                  dWidth: 0.35,
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
                        BlocProvider.of<VacationsHistoryCubit>(context)
                            .pickDate(date: time);
                        BlocProvider.of<VacationsHistoryCubit>(context).date =
                            formatDate(time, [yyyy, '-', mm]);
                        BlocProvider.of<VacationsHistoryCubit>(context)
                            .fetchVacationsHistory();
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
