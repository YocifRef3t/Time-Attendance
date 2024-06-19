import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/home/presentation/manage/home%20cubit/home_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/home%20view/date_filter_widget.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';

class RowDateWidget extends StatefulWidget {
  const RowDateWidget({super.key});

  @override
  State<RowDateWidget> createState() => _RowDateWidgetState();
}

class _RowDateWidgetState extends State<RowDateWidget> {
  DateTime? date;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextLoading(
              isLoading: isLoading,
              text: Text(
                translator(context).monthStats,
                style: AppFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: kIsWeb ? 21 : 19,
                        fontWeight: FontWeight.w500,
                        color: MyColors.myDarkBlue)),
              ),
            ),
            !isLoading
                ? DateFilterWidget(
                    dWidth: kIsWeb
                        ? 0.12
                        : Platform.isAndroid ||
                                Platform.isIOS ||
                                Platform.isFuchsia
                            ? 0.4
                            : 0.12,
                    onTap: () async {
                      await DatePicker.showDatePicker(
                        context,
                        minTime: DateTime(2022, 1),
                        maxTime: DateTime.now(),
                        currentTime: date,
                        locale: Intl.getCurrentLocale() == 'ar'
                            ? LocaleType.ar
                            : LocaleType.en,
                        onConfirm: (time) {
                          BlocProvider.of<HomeCubit>(context).date =
                              "${time.year}-${time.month}";
                          BlocProvider.of<HomeCubit>(context).fetchHomeData();
                          BlocProvider.of<HomeCubit>(context)
                              .picDate(date: time);
                        },
                      );
                    },
                    hint: date != null
                        ? formatDate(date!, [yyyy, '-', mm])
                        : formatDate(DateTime.now(), [yyyy, '-', mm]),
                    icon: Icons.filter_alt_outlined,
                  )
                : const Spacer(),
          ],
        ),
      ),
    );
  }
}
