import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/custom_text_form_field.dart';
import 'package:time_attendance/features/home/presentation/manage/late%20attendance%20cubit/late_attendance_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/ask%20for%20permission%20view/custom_date_dilog.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/ask%20for%20permission%20view/custom_time_picker.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/late%20attendance%20request%20view/late_attendance_data.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';
import '../../../../../reports/presentation/views/widgets/permission history view/no_internet_view.dart';
import '../ask for permission view/custom_list_tile.dart';

class LateAttendanceRequestViewBody extends StatefulWidget {
  const LateAttendanceRequestViewBody({Key? key}) : super(key: key);

  @override
  State<LateAttendanceRequestViewBody> createState() =>
      _LateAttendanceRequestViewBodyState();
}

class _LateAttendanceRequestViewBodyState
    extends State<LateAttendanceRequestViewBody> with LateAttendanceData {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LateAttendanceCubit, LateAttendanceState>(
      listener: (context, state) {
        if (state is LateAttendanceLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is LateAttendanceSuccess) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).done(message: state.message);
        } else if (state is LateAttendanceFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: MyColors.myBackGroundColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: kIsWeb
                              ? MediaQuery.of(context).size.width * .3
                              : MediaQuery.of(context).size.width * .85,
                          decoration: BoxDecoration(
                            color: MyColors.whiteGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String?>(
                            borderRadius: BorderRadius.circular(10),
                            focusColor: MyColors.myBlack,
                            iconEnabledColor: MyColors.myWazenLight,
                            iconDisabledColor: MyColors.myWazenLight,
                            dropdownColor: Colors.grey.shade100,
                            underline: Container(),
                            isExpanded: true,
                            value: selectedItem,
                            onChanged: (String? newValue) {
                              selectedItem = newValue;
                              setState(() {});
                            },
                            hint: Text(
                              translator(context).AttendanceType,
                              style: const TextStyle(color: MyColors.myBlack),
                            ),
                            items: getAttendanceTypeItems(context),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        CustomListTile(
                          onTap: () async {
                            date = await customDatePicker(
                              context: context,
                            );
                            setState(() {});
                          },
                          title: date != null
                              ? Text(
                                  formatDate(date!, [yyyy, '-', mm, '-', dd]),
                                  style: const TextStyle(
                                      color: MyColors.myCyanBlue),
                                )
                              : Text(translator(context).chooseDate,
                                  style: const TextStyle(
                                      color: MyColors.myCyanBlue)),
                          width: kIsWeb
                              ? MediaQuery.of(context).size.width * .3
                              : MediaQuery.of(context).size.width * .85,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        CustomListTile(
                          onTap: () async {
                            time = await customTimePicker(
                              context: context,
                            );
                            setState(() {});
                          },
                          title: time != null
                              ? Text(
                                  "${time!.hour}:${time!.minute}",
                                  style: const TextStyle(
                                      color: MyColors.myCyanBlue),
                                )
                              : Text(
                                  translator(context).startTime,
                                  style: const TextStyle(
                                      color: MyColors.myCyanBlue),
                                ),
                          width: kIsWeb
                              ? MediaQuery.of(context).size.width * .3
                              : MediaQuery.of(context).size.width * .85,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            width: kIsWeb
                                ? MediaQuery.of(context).size.width * .3
                                : MediaQuery.of(context).size.width,
                            child: CustomNumTextFormField(
                              type: TextInputType.text,
                              hint: translator(context).description,
                              num: 6,
                              controller: noteController,
                              sizedBoxHeight:
                                  MediaQuery.of(context).size.height * .015,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Visibility(
                          visible: isLoading,
                          replacement: CustomElevatedButton(
                              width: kIsWeb
                                  ? MediaQuery.of(context).size.width * .05
                                  : MediaQuery.of(context).size.width * .6,
                              onPressed: () {
                                if (!checkData(context)) return;
                                BlocProvider.of<LateAttendanceCubit>(context)
                                    .sendLateAttendance(
                                  date: formatDate(
                                      date!, [yyyy, '-', mm, '-', dd]),
                                  time: _formateTime(time!),
                                  eFunction: selectedItem!,
                                  description: noteController.text,
                                );
                              },
                              text: translator(context).submit),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : NoInternetScreen(
                  appBarTitle: translator(context).lateAttendance,
                );
        },
        child: const Center(
          child: CircularProgressIndicator(
            color: MyColors.myWazen,
          ),
        ),
      ),
    );
  }

  String _formateTime(TimeOfDay data) {
    return MaterialLocalizations.of(context).formatTimeOfDay(
      data,
      alwaysUse24HourFormat: true,
    );
  }
}
