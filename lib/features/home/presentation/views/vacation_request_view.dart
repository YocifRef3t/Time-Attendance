import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/home/presentation/manage/vacation%20request%20cubit/vacation_request_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/vacation%20request%20view/vacation_request_view_body.dart';

import '../../../../core/helper/translator.dart';

class VacationRequestView extends StatelessWidget {
  const VacationRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VacationRequestCubit(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
          text: translator(context).vacationRequest,
          context: context,
        ),
        body: const VacationRequestViewBody(),
      ),
    );
  }
}
