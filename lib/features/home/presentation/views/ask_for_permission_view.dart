import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/features/home/presentation/manage/ask%20permission%20request%20cubit/ask_permission_request_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/ask%20for%20permission%20view/ask_for_permission_view_body.dart';

import '../../../../core/helper/translator.dart';
import '../../../../core/widgets/custom_appbar.dart';

class AskForPermissionView extends StatelessWidget {
  const AskForPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AskPermissionRequestCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar.customAppBar(
          text: translator(context).askForPermissions,
          context: context,
        ),
        body: const AskForPermissionsBody(),
      ),
    );
  }
}
