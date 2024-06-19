import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/features/home/data/models/penalties_details_model.dart';
import 'package:time_attendance/features/home/presentation/manage/set%20penalty%20cubit/set_penalty_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/ask%20for%20permission%20view/custom_date_dilog.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/loans%20view/custom_radio_button.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';
import '../../../../../reports/presentation/views/widgets/permission history view/no_internet_view.dart';
import '../vacation request view/date_widget.dart';
import 'penalties_custom_drop_down.dart';
import 'penalties_type_widget.dart';
import 'set_penalties_data.dart';
import 'violation_list.dart';

class SetPenaltiesViewBody extends StatefulWidget {
  const SetPenaltiesViewBody({Key? key}) : super(key: key);

  @override
  State<SetPenaltiesViewBody> createState() => _SetPenaltiesViewBodyState();
}

class _SetPenaltiesViewBodyState extends State<SetPenaltiesViewBody>
    with SetPenaltiesData {
  TextEditingController statement = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController warning = TextEditingController();

  PenaltiesDetailsModel? model;
  DateTime? date;
  String? empId;

  bool isLoading = true;
  double? value = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SetPenaltyCubit, SetPenaltyState>(
      listener: (context, state) {
        if (state is SetPenaltyLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is SetPenaltySuccess) {
          isLoading = false;
          model = state.model;
          setState(() {});
        } else if (state is SetPenaltyFailure) {
          isLoading = false;
          setState(() {});
        } else if (state is RadioButtonChanged) {
          value = state.value;
          setState(() {});
        } else if (state is SendPenaltySuccess) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).done(message: state.message);
        } else if (state is SendPenaltyFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        } else if (state is SendPenaltyLoading) {
          isLoading = true;
          setState(() {});
        }
      },
      child: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: MyColors.myBackGroundColor,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: isLoading || model == null
                        ? const ListLoading()
                        : Column(
                            children: [
                              DateWidget(
                                icon: Icons.date_range,
                                dWidth: 0.85,
                                onTap: () async {
                                  date = await customDatePicker(
                                    context: context,
                                    currentDate: date,
                                  );

                                  setState(() {});
                                },
                                hint: date != null
                                    ? formatDate(
                                        date!, [yyyy, '-', mm, '-', dd])
                                    : translator(context).chooseDate,
                                label: translator(context).chooseDate,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              PenaltiesCustomDropDown(
                                onChanged: (value) {
                                  empId = value;
                                  BlocProvider.of<SetPenaltyCubit>(context)
                                      .empId = empId;
                                  setState(() {});
                                },
                                items: model!.employees!.map((e) {
                                  return DropdownMenuItem(
                                    value: e.empId,
                                    child: Text(e.name),
                                  );
                                }).toList(),
                                value: empId,
                                hint: translator(context).chooseEmp,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRadioButton(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    value: 1,
                                    groupValue: value ?? 0.00,
                                    onChanged: (value) {
                                      BlocProvider.of<SetPenaltyCubit>(context)
                                          .radioButton(value);
                                    },
                                    title: translator(context).violationList,
                                    size: 14,
                                  ),
                                  CustomRadioButton(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    value: 2,
                                    groupValue: value ?? 0.00,
                                    onChanged: (value) {
                                      BlocProvider.of<SetPenaltyCubit>(context)
                                          .radioButton(value);
                                    },
                                    title: translator(context).penaltiesType,
                                    size: 14,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              value == 1
                                  ? ViolationList(
                                      model: model!,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: PenaltiesTypeWidget(
                                        amountController: amount,
                                        statementController: statement,
                                        warningController: warning,
                                      ),
                                    ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05),
                              value == 1
                                  ? !isLoading
                                      ? CustomElevatedButton(
                                          ////// send violation
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          onPressed: () {
                                            BlocProvider.of<SetPenaltyCubit>(
                                                    context)
                                                .date = date !=
                                                    null
                                                ? formatDate(date!,
                                                    [yyyy, '-', mm, '-', dd])
                                                : null;
                                            BlocProvider.of<SetPenaltyCubit>(
                                                    context)
                                                .sendViolation();
                                          },
                                          text: translator(context).submit)
                                      : const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                  : !isLoading
                                      ? CustomElevatedButton(
                                          ////// send penalty
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          onPressed: () {
                                            BlocProvider.of<SetPenaltyCubit>(
                                                    context)
                                                .sendPenalty(
                                              empId: empId!,
                                              decisionAt: formatDate(date!,
                                                  [yyyy, '-', mm, '-', dd]),
                                              penaltyRsn: statement.text,
                                              penaltyAmount: amount.text,
                                              warningMsg: warning.text,
                                            );
                                          },
                                          text: translator(context).submit,
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                            ],
                          ),
                  ),
                )
              : NoInternetScreen(appBarTitle: translator(context).penalties);
        },
        child: const Center(
          child: CircularProgressIndicator(
            color: MyColors.myWazen,
          ),
        ),
      ),
    );
  }
}

/*
  

  



*/
