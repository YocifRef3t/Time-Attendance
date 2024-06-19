import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/home/presentation/manage/late%20attendance%20cubit/late_attendance_cubit.dart';

import '../../../../core/helper/translator.dart';
import 'widgets/late attendance request view/late_attendance_request_view_body.dart';

class LateAttendanceRequestView extends StatelessWidget {
  const LateAttendanceRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LateAttendanceCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar.customAppBar(
          text: translator(context).lateAttendance,
          context: context,
        ),
        body: const LateAttendanceRequestViewBody(),
      ),
    );
  }
}
