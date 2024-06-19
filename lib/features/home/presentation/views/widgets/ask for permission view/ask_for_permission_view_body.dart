import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/custom_text_form_field.dart';
import 'package:time_attendance/features/home/presentation/manage/ask%20permission%20request%20cubit/ask_permission_request_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/ask%20for%20permission%20view/ask_for_permission_data.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/ask%20for%20permission%20view/custom_time_picker.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';
import '../../../../../reports/presentation/views/widgets/permission history view/no_internet_view.dart';
import 'custom_date_dilog.dart';
import 'custom_list_tile.dart';

class AskForPermissionsBody extends StatefulWidget {
  const AskForPermissionsBody({Key? key}) : super(key: key);

  @override
  State<AskForPermissionsBody> createState() => _AskForPermissionsBodyState();
}

class _AskForPermissionsBodyState extends State<AskForPermissionsBody>
    with AskForPermissionsData {
  TextEditingController descController = TextEditingController();
  String? typeOfPermission;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? timeFrom;
  String? timeTo;
  String? noteAr;
  String? noteEn;
  String? selectedItem;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AskPermissionRequestCubit, AskPermissionRequestState>(
      listener: (context, state) {
        if (state is APRLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is APRSuccess) {
          ShowCustomSnackBar(context).done(message: state.message);
          GoRouter.of(context).pop();
        } else if (state is APRFailure) {
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: kIsWeb
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Text(
                            translator(context).permType,
                            style: AppFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: kIsWeb ? 20 : 16,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.myDarkBlue),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: kIsWeb
                                ? MediaQuery.of(context).size.width * 0.5
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
                              value: selectedItem == null
                                  ? null
                                  : typeOfPermission,
                              onChanged: (String? newValue) {
                                typeOfPermission = newValue;
                                selectedItem = newValue;
                                dateFrom = null;
                                dateTo = null;
                                timeFrom = null;
                                timeTo = null;
                                setState(() {});
                              },
                              hint: Text(
                                translator(context).permTypeHint,
                                style: const TextStyle(
                                    color: MyColors.lightGrey,
                                    fontSize: kIsWeb ? 18 : 14),
                              ),
                              items: getItems(context),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          Text(
                            translator(context).chooseDate,
                            style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: kIsWeb ? 20 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.myDarkBlue)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          selectedItem == null
                              ? CustomListTile(
                                  onTap: () async {
                                    dateFrom = await customDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                    );
                                    setState(() {});
                                  },
                                  title: dateFrom != null
                                      ? Text(
                                          formatDate(dateFrom!,
                                              [yyyy, "-", mm, "-", dd]),
                                          style: const TextStyle(
                                            color: MyColors.myCyanBlue,
                                            fontSize: kIsWeb ? 18 : 14,
                                          ),
                                        )
                                      : Text(
                                          translator(context).chooseDate,
                                          style: const TextStyle(
                                              color: MyColors.lightGrey,
                                              fontSize: kIsWeb ? 18 : 14),
                                        ),
                                  width: kIsWeb
                                      ? MediaQuery.of(context).size.width * .5
                                      : MediaQuery.of(context).size.width * .85,
                                )
                              : selectedItem == "3" || selectedItem == "5"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomListTile(
                                            onTap: () async {
                                              dateFrom = await customDatePicker(
                                                context: context,
                                                initialDate:
                                                    dateFrom ?? DateTime.now(),
                                              );
                                              setState(() {});
                                            },
                                            title: dateFrom != null
                                                ? Text(
                                                    formatDate(dateFrom!, [
                                                      yyyy,
                                                      "-",
                                                      mm,
                                                      "-",
                                                      dd
                                                    ]),
                                                    style: const TextStyle(
                                                        color: MyColors
                                                            .myCyanBlue),
                                                  )
                                                : Text(
                                                    translator(context)
                                                        .dateFrom,
                                                    style: const TextStyle(
                                                      color: MyColors.lightGrey,
                                                      fontSize:
                                                          kIsWeb ? 18 : 14,
                                                    ),
                                                  ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .05,
                                        ),
                                        CustomListTile(
                                          onTap: () async {
                                            dateTo = await customDatePicker(
                                                context: context,
                                                initialDate:
                                                    dateTo ?? DateTime.now());
                                            setState(() {});
                                          },
                                          title: dateTo != null
                                              ? Text(
                                                  formatDate(dateTo!,
                                                      [yyyy, "-", mm, "-", dd]),
                                                  style: const TextStyle(
                                                    color: MyColors.myCyanBlue,
                                                    fontSize: kIsWeb ? 18 : 14,
                                                  ),
                                                )
                                              : Text(
                                                  translator(context).dateTo,
                                                  style: const TextStyle(
                                                    color: MyColors.lightGrey,
                                                    fontSize: kIsWeb ? 18 : 14,
                                                  ),
                                                ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                        ),
                                      ],
                                    )
                                  : CustomListTile(
                                      onTap: () async {
                                        dateFrom = await customDatePicker(
                                          context: context,
                                          initialDate:
                                              dateFrom ?? DateTime.now(),
                                        );
                                        setState(() {});
                                      },
                                      title: dateFrom != null
                                          ? Text(
                                              formatDate(dateFrom!,
                                                  [yyyy, "-", mm, "-", dd]),
                                              style: const TextStyle(
                                                color: MyColors.myCyanBlue,
                                                fontSize: kIsWeb ? 18 : 14,
                                              ),
                                            )
                                          : Text(translator(context).chooseDate,
                                              style: const TextStyle(
                                                  color: MyColors.lightGrey,
                                                  fontSize: kIsWeb ? 18 : 14)),
                                      width: MediaQuery.of(context).size.width *
                                          .85),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          if (selectedItem != "5")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translator(context).startTime,
                                      style: AppFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: kIsWeb ? 20 : 16,
                                              fontWeight: FontWeight.w500,
                                              color: MyColors.myDarkBlue)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    CustomListTile(
                                        onTap: () async {
                                          TimeOfDay result =
                                              await customTimePicker(
                                                  context: context);
                                          timeFrom = _formateTime(result);
                                          setState(() {});
                                        },
                                        title: timeFrom != null
                                            ? Text(
                                                timeFrom.toString(),
                                                style: const TextStyle(
                                                  color: MyColors.myCyanBlue,
                                                  fontSize: kIsWeb ? 18 : 14,
                                                ),
                                              )
                                            : Text(
                                                translator(context).startTime,
                                                style: const TextStyle(
                                                    color: MyColors.lightGrey,
                                                    fontSize: kIsWeb ? 18 : 14),
                                              ),
                                        width: kIsWeb
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translator(context).endTime,
                                      style: AppFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: kIsWeb ? 20 : 16,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.myDarkBlue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    CustomListTile(
                                        onTap: () async {
                                          TimeOfDay result =
                                              await customTimePicker(
                                                  context: context);
                                          timeTo = _formateTime(result);
                                          setState(() {});
                                        },
                                        title: timeTo != null
                                            ? Text(
                                                timeTo.toString(),
                                                style: const TextStyle(
                                                  color: MyColors.myCyanBlue,
                                                  fontSize: kIsWeb ? 18 : 14,
                                                ),
                                              )
                                            : Text(
                                                translator(context).endTime,
                                                style: const TextStyle(
                                                  color: MyColors.lightGrey,
                                                  fontSize: kIsWeb ? 18 : 14,
                                                ),
                                              ),
                                        width: kIsWeb
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4),
                                  ],
                                ),
                              ],
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          kIsWeb
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: CustomNumTextFormField(
                                    type: TextInputType.text,
                                    hint: translator(context).description,
                                    num: 6,
                                    controller: descController,
                                    sizedBoxHeight:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                  ),
                                )
                              : CustomNumTextFormField(
                                  type: TextInputType.text,
                                  hint: translator(context).description,
                                  num: 6,
                                  controller: descController,
                                  sizedBoxHeight:
                                      MediaQuery.of(context).size.height *
                                          .015),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                          Center(
                            child: Visibility(
                              visible: isLoading,
                              replacement: CustomElevatedButton(
                                onPressed: () {
                                  if (Intl.getCurrentLocale() == 'ar') {
                                    noteAr = descController.text;
                                  } else {
                                    noteEn = descController.text;
                                  }
                                  BlocProvider.of<AskPermissionRequestCubit>(
                                          context)
                                      .setPermissionRequest(
                                    dateFrom: dateFrom,
                                    dateTo: dateTo,
                                    timeFrom: _formateTime(TimeOfDay.now()),
                                    timeTo: _formateTime(TimeOfDay.now()),
                                    noteAr: noteAr,
                                    noteEn: noteEn,
                                    typeOfPermission: typeOfPermission,
                                  );
                                },
                                text: translator(context).submit,
                                width: kIsWeb
                                    ? MediaQuery.of(context).size.width * 0.07
                                    : MediaQuery.of(context).size.width * .6,
                              ),
                              child: const CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : NoInternetScreen(
                  appBarTitle: translator(context).askForPermissions,
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
