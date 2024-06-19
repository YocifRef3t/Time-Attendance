import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/reports/presentation/manage/salary%20report%20cubit/salary_report_cubit.dart';

import '../../../../core/helper/translator.dart';
import 'widgets/salary report view/salary_report_view_body.dart';

class SalaryReportView extends StatelessWidget {
  const SalaryReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalaryReportCubit()..fetchSalaryReport(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
            text: translator(context).salaryReport, context: context),
        body: const SalaryReportViewBody(),
      ),
    );
  }
}
