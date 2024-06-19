import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/custom_loading_dialog.dart';
import 'package:time_attendance/features/home/presentation/manage/fingetprint%20cubit/fingerprint_cubit.dart';
import 'package:time_attendance/features/home/presentation/manage/home%20cubit/home_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';

class AttendanceRegistrationWidget extends StatelessWidget {
  const AttendanceRegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FingerprintCubit, FingerprintState>(
      listener: (context, state) {
        if (state is FingerprintLoading) {
          CustomLoadingDialog.show(
            context: context,
            message: translator(context).sendingData,
            child: const Center(
                child: CircularProgressIndicator(
              color: MyColors.myWazenLight,
            )),
          );
        } else if (state is FingerprintSuccess) {
          GoRouter.of(context).pop();
          ShowCustomSnackBar(context).done(message: state.message);
          BlocProvider.of<HomeCubit>(context).fetchHomeData();
        } else if (state is FingerprintNotSupported) {
          // GoRouter.of(context).pop();
          ShowCustomSnackBar(context).warning(message: state.message);
        } else if (state is FingerprintFailure) {
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
          GoRouter.of(context).pop();
        }
      },
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .18,
          width: MediaQuery.of(context).size.width * .92,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color.fromRGBO(235, 248, 255, 0.83),
                Color.fromRGBO(225, 251, 255, 0.83),
                Color.fromRGBO(200, 220, 236, 0.15)
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              5 == 4
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${translator(context).date} : ",
                          textAlign: TextAlign.center,
                          style: AppFonts.poppins(
                            textStyle: const TextStyle(
                              color: MyColors.myGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          formatDate(DateTime.now(), [yyyy, '-', m, '-', d]),
                          textAlign: TextAlign.center,
                          style: AppFonts.poppins(
                            textStyle: const TextStyle(
                              color: MyColors.myGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
              CustomElevatedButton(
                width: MediaQuery.of(context).size.width * 0.77,
                onPressed: () async {
                  BlocProvider.of<FingerprintCubit>(context).setAttendance();
                  // //ha7ot method developer option hna msh fe init state
                  // initPlatformState();
                  // inject.get<TimeBloc>().add(GetTimeHomeEvent());
                  // inject.get<LocationBloc>().add(GetLocationEvent());
                  // inject.get<BiometricsBloc>().add(DeviceSupportEvent());
                  // inject
                  //     .get<BiometricsBloc>()
                  //     .add(DeviceAvailableBiometricsEvent());
                  // inject
                  //     .get<BiometricsBloc>()
                  //     .add(DeviceCheckBiometricsEvent());
                },
                text: translator(context).attendance,
                color: MyColors.myWazenLight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translator(context).haveAGoodDay,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                        color: MyColors.myGreyLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  // Image.asset('assets/sun_icon.png')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
