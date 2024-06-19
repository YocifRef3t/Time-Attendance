import 'package:flutter/material.dart';
import 'package:time_attendance/core/constans/colors_constans.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/menu%20view/menu_view_body.dart';
import '../../../../core/helper/translator.dart';
import '../../../../core/widgets/custom_appbar.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBackGroundColor,
      appBar: CustomAppBar.customAppBar(
        text: translator(context).menu,
        context: context,
        // icon: Icons.notifications_none_outlined,
      ),
      body: const MenuViewBody(),
    );
  }
}
