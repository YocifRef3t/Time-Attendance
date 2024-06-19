import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/menu/presentation/manage/attendance%20history%20cubit/attendance_history_cubit.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/attendance%20history%20view/attendance_history_view_body.dart';
import '../../../../core/helper/translator.dart';

class AttendanceHistoryView extends StatelessWidget {
  const AttendanceHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceHistoryCubit()..fetchAttendanceHistory(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
            text: translator(context).attendanceHistory, context: context),
        body: const AttendanceHistoryViewBody(),
      ),
    );
  }
}
