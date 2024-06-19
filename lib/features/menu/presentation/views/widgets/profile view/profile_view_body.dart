import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/helper/get_profile_data.dart';
import 'package:time_attendance/features/menu/presentation/views/widgets/profile%20view/profile_avatar.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../reports/presentation/views/widgets/permission history view/no_internet_view.dart';
import 'profile_card.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context,
          ConnectivityResult connectivity, Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        return connected
            ? Scaffold(
                backgroundColor: MyColors.myBackGroundColor,
                body: 5 == 5
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: MyColors.myBackGroundColor,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const ProfileAvatar(),
                              const SizedBox(height: 30),
                              ProfileInfoCard(
                                icon: Icons.numbers_outlined,
                                title: translator(context).id,
                                desc: GetEmployeeData().id.toString(),
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.email_outlined,
                                title: translator(context).email,
                                desc: GetEmployeeData().email,
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.person_outline,
                                title: translator(context).nationality,
                                desc: GetEmployeeData().countryName,
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.phone_android_outlined,
                                title: translator(context).mobile,
                                desc: GetEmployeeData().phone,
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.home_outlined,
                                title: translator(context).address,
                                desc: GetEmployeeData().address,
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.home_work_outlined,
                                title: translator(context).companyName,
                                desc: GetEmployeeData().companyName,
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.work_outline,
                                title: translator(context).positionTitle,
                                desc: GetEmployeeData().jobName,
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.timer_outlined,
                                title: translator(context).workHours,
                                desc: "${GetProfileData().workHour} Hours",
                              ),
                              const SizedBox(height: 15),
                              ProfileInfoCard(
                                icon: Icons.monetization_on_outlined,
                                title:
                                    translator(context).netSalary.split(':')[0],
                                desc: GetProfileData().totalSalary,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        color: MyColors.myBackGroundColor,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: MyColors.myWazen,
                          ),
                        )),
              )
            : const NoInternetScreen(appBarTitle: 'profile');
      },
      child: const Center(
        child: CircularProgressIndicator(
          color: MyColors.myWazen,
        ),
      ),
    );
  }
}
