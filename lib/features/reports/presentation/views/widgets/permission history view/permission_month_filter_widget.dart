import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/permissions%20cubit/permissions_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/utls/app_fonts.dart';
import '../../../../../home/presentation/views/widgets/home view/date_filter_widget.dart';

class PermissionMonthFilterWidget extends StatefulWidget {
  const PermissionMonthFilterWidget({Key? key}) : super(key: key);

  @override
  State<PermissionMonthFilterWidget> createState() =>
      _PermissionMonthFilterWidgetState();
}

class _PermissionMonthFilterWidgetState
    extends State<PermissionMonthFilterWidget> {
  DateTime? date;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionsCubit, PermissionsState>(
      listener: (context, state) {
        if (state is PermissionsLoading) {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: BlocBuilder<PermissionsCubit, PermissionsState>(
          builder: (context, state) {
            if (state is PermissionsLoading) {
              return Row(
                children: [
                  TextLoading(
                    text: Text(
                      translator(context).permissionsHistory,
                      style: AppFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: kIsWeb ? 22 : 19,
                          fontWeight: FontWeight.w500,
                          color: MyColors.myDarkBlue,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  translator(context).permissionsHistory,
                  style: AppFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: kIsWeb ? 22 : 19,
                      fontWeight: FontWeight.w500,
                      color: MyColors.myDarkBlue,
                    ),
                  ),
                ),
                DateFilterWidget(
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
                        BlocProvider.of<PermissionsCubit>(context)
                            .picDate(date: time);
                        BlocProvider.of<PermissionsCubit>(context)
                            .fetchPermissionsHistory();
                      },
                    );
                  },
                  hint: date != null
                      ? '${date!.year}-${date!.month}'
                      : '${DateTime.now().year}-${DateTime.now().month}',
                  icon: Icons.filter_alt_outlined,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
