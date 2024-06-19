import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/custom_text_form_field.dart';
import 'package:time_attendance/features/home/presentation/manage/vacation%20request%20cubit/vacation_request_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/ask%20for%20permission%20view/custom_date_dilog.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/vacation%20request%20view/vacation_request_data.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';
import '../../../../../reports/presentation/views/widgets/permission history view/no_internet_view.dart';
import 'date_widget.dart';

class VacationRequestViewBody extends StatefulWidget {
  const VacationRequestViewBody({Key? key}) : super(key: key);

  @override
  State<VacationRequestViewBody> createState() =>
      _VacationRequestViewBodyState();
}

class _VacationRequestViewBodyState extends State<VacationRequestViewBody>
    with VacationRequestData {
  TextEditingController noteController = TextEditingController();
  DateTime? dateFrom;
  DateTime? dateTo;
  String? duration = "0";
  String? selectedItem;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<VacationRequestCubit, VacationRequestState>(
      listener: (context, state) {
        if (state is VacationRequestLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is VacationRequestSuccess) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).done(message: state.message);
          GoRouter.of(context).pop();
        } else if (state is VacationRequestFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        } else if (state is VacationRequestWarning) {
          ShowCustomSnackBar(context).warning(message: state.message);
        }
      },
      child: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: MyColors.myBackGroundColor,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: kIsWeb
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Text(
                                      translator(context).vacationType,
                                      style: AppFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: kIsWeb ? 22 : 18,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.myDarkBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  // border: Border.all(color: MyColors.myCyanBlue),
                                  color: MyColors.whiteGrey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: kIsWeb
                                    ? MediaQuery.of(context).size.width * .3
                                    : MediaQuery.of(context).size.width * .8,
                                child: DropdownButton<String?>(
                                  borderRadius: BorderRadius.circular(10),
                                  focusColor: MyColors.myBlack,
                                  dropdownColor: Colors.grey.shade100,
                                  iconEnabledColor: MyColors.myWazenLight,
                                  iconDisabledColor: MyColors.myWazenLight,
                                  underline: Container(),
                                  isExpanded: true,
                                  value: selectedItem,
                                  onChanged: (String? newValue) {
                                    selectedItem = newValue;
                                    setState(() {});
                                  },
                                  hint: Text(
                                    translator(context).vacationType,
                                    style: const TextStyle(
                                        color: MyColors.myBlack),
                                  ),
                                  items: getItems(context),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kIsWeb
                                ? MediaQuery.of(context).size.height * .05
                                : MediaQuery.of(context).size.height * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DateWidget(
                                icon: Icons.date_range,
                                dWidth: kIsWeb ? 0.2 : 0.4,
                                onTap: () async {
                                  dateFrom = await customDatePicker(
                                    context: context,
                                    initialDate: dateFrom ?? DateTime.now(),
                                    firstDate: DateTime.now(),
                                    // lastDate: dateTo,
                                  );
                                  DateTime now = DateTime.now();
                                  duration = _getDuration(
                                    startDate: dateFrom ??
                                        DateTime(now.year, now.month, now.day),
                                    endDate: dateTo ??
                                        DateTime(now.year, now.month, now.day),
                                  );
                                  setState(() {});
                                },
                                hint: dateFrom != null
                                    ? formatDate(
                                        dateFrom!, [yyyy, '-', mm, '-', dd])
                                    : formatDate(DateTime.now(),
                                        [yyyy, '-', mm, '-', dd]),
                                label: translator(context).vacationStart,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .01,
                              ),
                              DateWidget(
                                icon: Icons.date_range,
                                dWidth: kIsWeb ? 0.2 : 0.4,
                                onTap: () async {
                                  dateTo = await customDatePicker(
                                    context: context,
                                    initialDate: dateTo,
                                    firstDate: dateFrom ?? DateTime.now(),
                                    currentDate: dateTo ?? DateTime.now(),
                                  );
                                  DateTime now = DateTime.now();
                                  duration = _getDuration(
                                    startDate: dateFrom ??
                                        DateTime(now.year, now.month, now.day),
                                    endDate: dateTo ??
                                        DateTime(now.year, now.month, now.day),
                                  );

                                  setState(() {});
                                },
                                hint: dateTo != null
                                    ? formatDate(
                                        dateTo!,
                                        [yyyy, '-', mm, '-', dd],
                                      )
                                    : formatDate(
                                        DateTime.now(),
                                        [yyyy, '-', mm, '-', dd],
                                      ),
                                label: translator(context).vacationEnd,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kIsWeb
                                ? MediaQuery.of(context).size.height * .05
                                : MediaQuery.of(context).size.height * .02,
                          ),
                          DateWidget(
                            icon: Icons.timelapse_rounded,
                            dWidth: kIsWeb ? 0.4 : 0.8,
                            onTap: () {},
                            hint: duration != null
                                ? '$duration ${translator(context).days}'
                                : translator(context).vacationDuration,
                            label: translator(context).vacationDuration,
                          ),
                          kIsWeb
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02,
                                )
                              : const SizedBox(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: CustomNumTextFormField(
                                controller: noteController,
                                hint: translator(context).notes,
                                num: 1,
                                type: TextInputType.text,
                                sizedBoxHeight:
                                    MediaQuery.of(context).size.height * .01),
                          ),
                          const SizedBox(
                            height: kIsWeb ? 100 : 150,
                          ),
                          Visibility(
                            visible: isLoading,
                            replacement: CustomElevatedButton(
                              onPressed: () {
                                BlocProvider.of<VacationRequestCubit>(context)
                                    .sendVacationRequest(
                                  dateFrom: formatDate(
                                      dateFrom ?? DateTime.now(),
                                      [yyyy, '-', mm, '-', dd]),
                                  dateTo: formatDate(dateTo ?? DateTime.now(),
                                      [yyyy, '-', mm, '-', dd]),
                                  vacationType: selectedItem,
                                  noteAr: noteController.text,
                                );
                              },
                              text: translator(context).submit,
                              width: kIsWeb
                                  ? MediaQuery.of(context).size.width * .06
                                  : MediaQuery.of(context).size.width * .6,
                            ),
                            child: const CircularProgressIndicator(),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : NoInternetScreen(
                  appBarTitle: translator(context).vacationRequest);
        },
        child: const Center(
          child: CircularProgressIndicator(
            color: MyColors.myWazen,
          ),
        ),
      ),
    );
  }

  String? _getDuration({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    int duration;
    duration = endDate.difference(startDate).inDays;
    if (duration < 0) {
      return null;
    }
    return duration.toString();
  }
}
