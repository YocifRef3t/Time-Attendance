import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/home/presentation/manage/set%20penalty%20cubit/set_penalty_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/set%20penalties%20view/set_penalties_view_body.dart';

import '../../../../core/helper/translator.dart';

class SetPenaltiesView extends StatelessWidget {
  const SetPenaltiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetPenaltyCubit()..fetchPenaltyDetails(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
          text: translator(context).penalties,
          context: context,
        ),
        body: const SetPenaltiesViewBody(),
      ),
    );
  }
}
