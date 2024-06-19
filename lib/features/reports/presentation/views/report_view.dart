import 'package:flutter/material.dart';

import '../../../../core/constans/colors_constans.dart';
import '../../../../core/helper/translator.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'widgets/report view/report_view_body.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
          text: translator(context).reports,
          context: context,
          // icon: Icons.notifications_none_outlined,
        ),
        backgroundColor: MyColors.myBackGroundColor,
        body: const ReportViewBody(),
      ),
    );
  }
}
