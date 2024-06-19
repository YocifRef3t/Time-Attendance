import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/features/reports/presentation/manage/permissions%20cubit/permissions_cubit.dart';
import 'package:time_attendance/features/reports/presentation/views/widgets/permission%20history%20view/permission_history_view_body.dart';

import '../../../../core/helper/translator.dart';
import '../../../../core/widgets/custom_appbar.dart';

class PermissionHistoryView extends StatelessWidget {
  const PermissionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PermissionsCubit()..fetchPermissionsHistory(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
            text: translator(context).permissionsHistory, context: context),
        body: const PermissionHistoryViewBody(),
      ),
    );
  }
}
