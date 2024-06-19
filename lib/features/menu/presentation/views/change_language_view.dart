import 'package:flutter/material.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/change%20language%20view/chanage_language_view_body.dart';

import '../../../../core/helper/translator.dart';
import '../../../../core/widgets/custom_appbar.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
          text: translator(context).language, context: context),
      body: const ChangeLanguageViewBody(),
    );
  }
}
