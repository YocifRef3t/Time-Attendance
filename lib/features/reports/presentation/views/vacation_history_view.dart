import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/reports/presentation/manage/vacations%20history%20cubit/vacations_cubit.dart';
import 'package:time_attendance/features/reports/presentation/views/widgets/vacation%20history%20view/vacation_history_view_body.dart';

import '../../../../core/helper/translator.dart';

class VacationHistoryView extends StatelessWidget {
  const VacationHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VacationsHistoryCubit()..fetchVacationsHistory(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
          text: translator(context).vacationHistory,
          context: context,
        ),
        body: const VacationHistoryViewBody(),
      ),
    );
  }
}
