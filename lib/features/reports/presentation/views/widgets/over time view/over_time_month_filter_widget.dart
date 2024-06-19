import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/home%20view/date_filter_widget.dart';
import 'package:time_attendance/features/reports/presentation/manage/overtime%20cubit/overtime_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';

class NewOverTimeMonthFilterWidget extends StatefulWidget {
  const NewOverTimeMonthFilterWidget({Key? key}) : super(key: key);

  @override
  State<NewOverTimeMonthFilterWidget> createState() =>
      _NewOverTimeMonthFilterWidgetState();
}

class _NewOverTimeMonthFilterWidgetState
    extends State<NewOverTimeMonthFilterWidget> {
  DateTime? date;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OvertimeCubit, OvertimeState>(
      listener: (context, state) {
        if (state is OvertimeLoading) {
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
              translator(context).overTime,
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
                        BlocProvider.of<OvertimeCubit>(context)
                            .pickDate(date: time);
                        BlocProvider.of<OvertimeCubit>(context).date =
                            formatDate(time, [yyyy, '-', mm]);
                        BlocProvider.of<OvertimeCubit>(context).fetchOvertime();
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
