import 'package:flutter/material.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/about%20view/about_view_body.dart';

import '../../../../core/helper/translator.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
        text: translator(context).about,
        context: context,
      ),
      body: const AboutViewBody(),
    );
  }
}
