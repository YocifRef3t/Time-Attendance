import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/constans/colors_constans.dart';
import 'package:time_attendance/features/reports/presentation/manage/loans%20request%20cubit/loans_request_cubit.dart';

import '../../../../core/helper/translator.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'widgets/loans request view/loans_request_view_body.dart';

class LoansRequestView extends StatelessWidget {
  const LoansRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoansRequestCubit()..fetchFinancialDetailsData(),
      child: Scaffold(
        backgroundColor: MyColors.myBackGroundColor,
        appBar: CustomAppBar.customAppBar(
            text: translator(context).loansRequestSent, context: context),
        body: const LoansRequestViewBody(),
      ),
    );
  }
}
