import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/home/presentation/manage/loans%20cubit/loans_request_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/loans%20view/loans_view_body.dart';
import '../../../../core/helper/translator.dart';

class LoansView extends StatelessWidget {
  const LoansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendLoansRequestCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar.customAppBar(
          text: translator(context).loan,
          context: context,
        ),
        body: const LoansViewBody(),
      ),
    );
  }
}
