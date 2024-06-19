import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/menu/presentation/manage/privacy%20cubit/privacy_cubit.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/privacy%20view/privacy_view_body.dart';
import '../../../../core/helper/translator.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
          text: translator(context).privacy, context: context),
      body: BlocProvider(
        create: (context) => PrivacyCubit(),
        child: const PrivacyViewBody(),
      ),
    );
  }
}
