import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/auth/presentation/manage/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:time_attendance/features/auth/presentation/views/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
          text: translator(context).resetPassword,
          context: context,
          autoLeading: true,
        ),
        body: const ResetPasswordViewBody(),
      ),
    );
  }
}
