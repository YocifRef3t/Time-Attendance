import 'package:flutter/material.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/reports/presentation/views/widgets/penalites%20view/penalites_view_body.dart';

import '../../../../core/helper/translator.dart';

class PenaltiesView extends StatelessWidget {
  const PenaltiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
          text: translator(context).penalties, context: context),
      body: const PenaltiesViewBody(),
    );
  }
}
