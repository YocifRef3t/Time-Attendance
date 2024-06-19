import 'package:flutter/material.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/profile%20view/profile_view_body.dart';
import '../../../../core/helper/translator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
          text: translator(context).profile, context: context),
      body: const ProfileViewBody(),
    );
  }
}
