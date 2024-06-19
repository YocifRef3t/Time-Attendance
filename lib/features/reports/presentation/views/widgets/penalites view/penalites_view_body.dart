import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/features/reports/data/models/penalties%20report/penalties_report_model.dart';
import 'package:time_attendance/features/reports/presentation/manage/penalties%20report%20cubit/penalties_report_cubit.dart';
import 'package:time_attendance/features/reports/presentation/views/widgets/penalites%20view/penalties_dialog.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';
import '../permission history view/no_internet_view.dart';
import 'history_row_widget.dart';

class PenaltiesViewBody extends StatefulWidget {
  const PenaltiesViewBody({Key? key}) : super(key: key);

  @override
  State<PenaltiesViewBody> createState() => _PenaltiesViewBodyState();
}

class _PenaltiesViewBodyState extends State<PenaltiesViewBody> {
  TextEditingController rejectReason = TextEditingController();
  bool isLoading = false;
  List<PenaltiesReportModel>? model;
  @override
  void initState() {
    BlocProvider.of<PenaltiesReportCubit>(context).fetchPenaltiesReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PenaltiesReportCubit, PenaltiesReportState>(
        listener: (context, state) {
          if (state is PenaltiesReportLoading) {
            isLoading = true;
            setState(() {});
          } else if (state is PenaltiesReportSuccess) {
            isLoading = false;
            model = state.models;
            setState(() {});
          } else if (state is PenaltiesReportFailure) {
            isLoading = false;
            setState(() {});
            ShowCustomSnackBar(context).failure(message: state.errorMessage);
          } else if (state is PenaltiesReportWarning) {
            ShowCustomSnackBar(context).warning(message: state.message);
          } else if (state is SendGrievanceSuccess) {
            ShowCustomSnackBar(context).done(message: state.message);
            GoRouter.of(context).pop();
            rejectReason.text = "";
            setState(() {});
          } else if (state is SendGrievanceFailure) {
            ShowCustomSnackBar(context).failure(message: state.errorMessage);
            rejectReason.text = "";
            GoRouter.of(context).pop();
          }
        },
        child: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            return connected
                ? Container(
                    color: MyColors.myBackGroundColor,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child:
                        BlocBuilder<PenaltiesReportCubit, PenaltiesReportState>(
                      builder: (context, state) {
                        if (state is PenaltiesReportLoading) {
                          return const ListLoading(
                            height: 150,
                          );
                        }
                        return model!.isEmpty
                            ? Text(
                                translator(context).noData,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: model!.length,
                                itemBuilder: (context, index) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  width: MediaQuery.of(context).size.width * .8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: MyColors.statlightblue,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HistoryRowWidget(
                                        title: translator(context).decisionDate,
                                        content:
                                            "${model![index].decisionDate}",
                                      ),
                                      model![index].penaltiesHdrsDscAr!.isEmpty
                                          ? HistoryRowWidget(
                                              title: translator(context)
                                                  .penaltiesDscAr,
                                              content:
                                                  "${model![index].penaltyType}")
                                          : HistoryRowWidget(
                                              title: translator(context)
                                                  .penaltiesDscAr,
                                              content:
                                                  "${model![index].penaltiesHdrsDscAr}"),
                                      model![index].penaltiesDtlsDscAr!.isEmpty
                                          ? HistoryRowWidget(
                                              title: translator(context)
                                                  .penaltiesDetailsDscAr,
                                              content:
                                                  "${model![index].penaltyReason}")
                                          : HistoryRowWidget(
                                              title: translator(context)
                                                  .penaltiesDetailsDscAr,
                                              content:
                                                  "${model![index].penaltiesDtlsDscAr}"),
                                      HistoryRowWidget(
                                          title:
                                              translator(context).grossSalary,
                                          content:
                                              "${model![index].grossSalary}"),
                                      HistoryRowWidget(
                                          title:
                                              translator(context).discountValue,
                                          content:
                                              "${model![index].discountValue}"),
                                      HistoryRowWidget(
                                          title: translator(context).netSalary,
                                          content:
                                              "${model![index].netSalary}"),
                                      HistoryRowWidget(
                                          title: translator(context).reviewCase,
                                          content:
                                              "${model![index].reviewCase}"),
                                      Center(
                                        child: CustomElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return PenaltiesDialog(
                                                    model: model![index],
                                                    rejectReason: rejectReason);
                                              },
                                            );
                                          },
                                          text: translator(context).grievance,
                                          width: 150,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ))
                : NoInternetScreen(appBarTitle: translator(context).penalties);
          },
          child: const Center(
            child: CircularProgressIndicator(
              color: MyColors.myWazen,
            ),
          ),
        ));
  }
}
