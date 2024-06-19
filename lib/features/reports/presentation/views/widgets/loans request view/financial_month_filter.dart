import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/loans%20request%20cubit/loans_request_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../home/presentation/views/widgets/home view/date_filter_widget.dart';

class FinancialMonthFilter extends StatefulWidget {
  const FinancialMonthFilter({Key? key}) : super(key: key);

  @override
  State<FinancialMonthFilter> createState() => _FinancialMonthFilterState();
}

class _FinancialMonthFilterState extends State<FinancialMonthFilter> {
  DateTime? date;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoansRequestCubit, LoansRequestState>(
      listener: (context, state) {
        if (state is LoansRequestLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is PickDate) {
          date = state.date;
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
              translator(context).loansRequestSent,
              overflow: TextOverflow.ellipsis,
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
                        BlocProvider.of<LoansRequestCubit>(context)
                            .pickDate(date: time);
                        BlocProvider.of<LoansRequestCubit>(context).date =
                            formatDate(time, [yyyy, '-', mm]);
                        BlocProvider.of<LoansRequestCubit>(context)
                            .fetchFinancialDetailsData();
                      },
                    );
                  },
                  hint: date != null
                      ? '${date!.year}-${date!.month}'
                      : '${DateTime.now().year}-${DateTime.now().month}',
                  icon: Icons.filter_alt_outlined,
                )
              : const Spacer(),
        ],
      ),
    );
  }
}
