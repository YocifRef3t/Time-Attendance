import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:time_attendance/core/helper/get_profile_data.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/home/data/models/home_model.dart';
import 'package:time_attendance/features/home/presentation/manage/home%20cubit/home_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/home%20view/profile_card.dart';
import 'package:time_attendance/features/menu/presentation/manage/profile%20cubit/profile_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import 'attendance_regestration_widget.dart';
import 'month_stats_widget.dart';
import 'row_date_widget.dart';
import 'schedule_widget.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool? _developerMode;
  String? imageUrl;

  bool isLoading = true;
  HomeModel? model;

  @override
  void initState() {
    _developerOptinsCheck();
    super.initState();
  }

  void _developerOptinsCheck() async {
    bool developerMode;
    try {
      developerMode = await FlutterJailbreakDetection.developerMode;
    } on PlatformException {
      developerMode = true;
    }
    if (!mounted) return;
    _developerMode = developerMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is HomeSuccess) {
          isLoading = false;
          model = state.homeModel;
          setState(() {});
        } else if (state is HomeFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: LiquidPullToRefresh(
        color: MyColors.myWazenLight,
        height: 80,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 300,
        onRefresh: () async {
          await BlocProvider.of<HomeCubit>(context).fetchHomeData();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            semanticChildCount: 1,
            shrinkWrap: true,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocListener<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        imageUrl = GetProfileData().employeeImage;
                        setState(() {});
                      },
                      child: ProfileCard(
                        imageUrl: imageUrl,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    kIsWeb
                        ? const SizedBox()
                        : Platform.isAndroid && _developerMode == null
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Platform.isAndroid && _developerMode == true
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.7),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        translator(context)
                                            .developerOptionsMessage,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                : Platform.isAndroid && _developerMode == false
                                    ? const AttendanceRegistrationWidget()
                                    : Platform.isFuchsia &&
                                            _developerMode == null
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Platform.isFuchsia &&
                                                _developerMode == true
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.red
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    translator(context)
                                                        .developerOptionsMessage,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Platform.isFuchsia &&
                                                    _developerMode == false
                                                ? const AttendanceRegistrationWidget()
                                                : Platform.isIOS
                                                    ? const AttendanceRegistrationWidget()
                                                    : const SizedBox(),
                    const RowDateWidget(),
                    SizedBox(
                      child: model != null
                          ? Column(
                              children: [
                                MonthStatsWidget(
                                  model: model,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextLoading(
                                        isLoading: isLoading,
                                        text: Text(
                                          translator(context).schedule,
                                          style: AppFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: kIsWeb ? 21 : 19,
                                                  fontWeight: FontWeight.w500,
                                                  color: MyColors.myDarkBlue)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                ScheduleWidget(
                                  model: model,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                )
                              ],
                            )
                          : !isLoading
                              ? Center(
                                  child: Text(translator(context).noData),
                                )
                              : const ListLoading(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
