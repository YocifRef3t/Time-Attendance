import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_profile_data.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/home%20view/profile_card.dart';
import 'package:time_attendance/features/menu/presentation/manage/profile%20cubit/profile_cubit.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/menu%20view/logout_card.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import 'info_card.dart';
import 'language_card.dart';

class MenuViewBody extends StatefulWidget {
  const MenuViewBody({Key? key}) : super(key: key);

  @override
  State<MenuViewBody> createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody> {
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          imageUrl = GetProfileData().employeeImage;
          setState(() {});
        }
      },
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: kIsWeb
                ? [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileCard(
                            imageUrl: imageUrl,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoCard(
                          icon: Icons.person_2_outlined,
                          iconColor: MyColors.personIconColor,
                          backGroundColor: MyColors.personIconBackGroundColor,
                          title: translator(context).info,
                          desc: translator(context).infoDec,
                          screen: AppRouter.kProfileViewPath,
                        ),
                        const SizedBox(width: 24),
                        InfoCard(
                          icon: Icons.lock_outline,
                          iconColor: MyColors.privacyIconColor,
                          backGroundColor: MyColors.privacyIconBackGroundColor,
                          title: translator(context).privacy,
                          desc: translator(context).privacyDec,
                          screen: AppRouter.kPrivacyViewPath,
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoCard(
                          icon: Icons.assessment_outlined,
                          iconColor: MyColors.attendanceIconColor,
                          backGroundColor:
                              MyColors.attendanceIconBackGroundColor,
                          title: translator(context).attendanceHistory,
                          desc: translator(context).attendanceHistoryDec,
                          screen: AppRouter.kAttendanceHistory,
                        ),
                        const SizedBox(width: 24),
                        const LanguageCard(),
                        const SizedBox(height: 24),
                      ],
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoCard(
                          icon: Icons.help_outline_outlined,
                          iconColor: MyColors.myWazen,
                          backGroundColor:
                              MyColors.attendanceIconBackGroundColor,
                          title: translator(context).about,
                          desc: translator(context).aboutDec,
                          screen: AppRouter.kLoginViewPath,
                        ),
                        const SizedBox(width: 24),
                        LogoutCard(
                          icon: Icons.logout_outlined,
                          iconColor: MyColors.logoutIconColor,
                          backGroundColor: MyColors.logoutIconBackGroundColor,
                          title: translator(context).logout,
                        ),
                      ],
                    ),
                  ]
                : [
                    const SizedBox(height: 20),
                    ProfileCard(
                      imageUrl: imageUrl,
                    ),
                    const SizedBox(height: 20),
                    InfoCard(
                      icon: Icons.person_2_outlined,
                      iconColor: MyColors.personIconColor,
                      backGroundColor: MyColors.personIconBackGroundColor,
                      title: translator(context).info,
                      desc: translator(context).infoDec,
                      screen: AppRouter.kProfileViewPath,
                    ),
                    const SizedBox(height: 24),
                    InfoCard(
                      icon: Icons.lock_outline,
                      iconColor: MyColors.privacyIconColor,
                      backGroundColor: MyColors.privacyIconBackGroundColor,
                      title: translator(context).privacy,
                      desc: translator(context).privacyDec,
                      screen: AppRouter.kPrivacyViewPath,
                    ),
                    const SizedBox(height: 24),
                    InfoCard(
                      icon: Icons.assessment_outlined,
                      iconColor: MyColors.attendanceIconColor,
                      backGroundColor: MyColors.attendanceIconBackGroundColor,
                      title: translator(context).attendanceHistory,
                      desc: translator(context).attendanceHistory,
                      screen: AppRouter.kAttendanceHistory,
                    ),
                    const SizedBox(height: 24),
                    const LanguageCard(),
                    const SizedBox(height: 24),
                    InfoCard(
                      icon: Icons.help_outline_outlined,
                      iconColor: MyColors.myWazen,
                      backGroundColor: MyColors.attendanceIconBackGroundColor,
                      title: translator(context).about,
                      desc: translator(context).aboutDec,
                      screen: AppRouter.kAboutViewPath,
                    ),
                    const SizedBox(height: 24),
                    LogoutCard(
                      icon: Icons.logout_outlined,
                      iconColor: MyColors.logoutIconColor,
                      backGroundColor: MyColors.logoutIconBackGroundColor,
                      title: translator(context).logout,
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
