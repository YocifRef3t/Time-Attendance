import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/helper/get_profile_data.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/circle_loaging.dart';
import 'package:time_attendance/features/menu/presentation/manage/profile%20cubit/profile_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';

class ProfileCard extends StatefulWidget {
  final String? imageUrl;
  const ProfileCard({super.key, required this.imageUrl});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  var time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          setState(() {});
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: MyColors.myWhite,
            radius: kIsWeb
                ? MediaQuery.of(context).size.width * 0.04
                : MediaQuery.of(context).size.width * 0.1,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: GetProfileData().employeeImage,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircleLoading(),
                errorWidget: (context, url, error) => const CircleLoading(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              5 == 6
                  ? const SizedBox()
                  : Row(
                      children: [
                        time.hour > 5 && time.hour < 12
                            ? Text(
                                translator(context).goodMorning,
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: MyColors.myGrey,
                                    fontSize: kIsWeb ? 18 : 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            : time.hour > 12 && time.hour < 17
                                ? Text(
                                    translator(context).goodAfternoon,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: MyColors.myGrey,
                                        fontSize: kIsWeb ? 18 : 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : Text(
                                    translator(context).goodEvening,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: MyColors.myGrey,
                                        fontSize: kIsWeb ? 18 : 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                        const SizedBox(
                          width: 10,
                        ),
                        // Image.asset('assets/sun_icon.png')
                      ],
                    ),
              Text(
                GetEmployeeData().name,
                style: AppFonts.poppins(
                  textStyle: const TextStyle(
                    color: MyColors.myDarkBlue,
                    fontSize: kIsWeb ? 18 : 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
