import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/reports/presentation/manage/overtime%20cubit/overtime_cubit.dart';
import 'package:time_attendance/features/reports/presentation/views/widgets/over%20time%20view/over_time_view.dart';

import '../../../../core/helper/translator.dart';

class OverTimeView extends StatelessWidget {
  const OverTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OvertimeCubit()..fetchOvertime(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
            text: translator(context).overTime, context: context),
        body: const OverTimeViewBody(),
      ),
    );
  }
}
