import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/data/models/salary%20report/salary_report_model.dart';
import 'package:time_attendance/features/reports/presentation/manage/salary%20report%20cubit/salary_report_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../permission history view/no_internet_view.dart';

class SalaryReportViewBody extends StatefulWidget {
  const SalaryReportViewBody({Key? key}) : super(key: key);

  @override
  State<SalaryReportViewBody> createState() => _SalaryReportViewBodyState();
}

class _SalaryReportViewBodyState extends State<SalaryReportViewBody> {
  bool isLoading = true;
  List<SalaryReportModel>? model;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SalaryReportCubit, SalaryReportState>(
      listener: (context, state) {
        if (state is SalaryReportLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is SalaryReportSuccess) {
          isLoading = false;
          model = state.model;
          setState(() {});
        } else if (state is SalaryReportFailure) {
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
          await BlocProvider.of<SalaryReportCubit>(context).fetchSalaryReport();
        },
        child: ListView(
          children: [
            OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;
                return connected
                    ? Container(
                        color: MyColors.myBackGroundColor,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextLoading(
                                isLoading: isLoading,
                                text: Text(
                                  translator(context).salaryReport,
                                  style: AppFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: kIsWeb ? 26 : 22,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.myDarkBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<SalaryReportCubit, SalaryReportState>(
                              builder: (context, state) {
                                if (state is SalaryReportLoading) {
                                  return const ListLoading();
                                }
                                return model!.isNotEmpty
                                    ? Flexible(
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: model!.length,
                                          itemBuilder: (context, index) =>
                                              Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .92,
                                            decoration: BoxDecoration(
                                              color: MyColors.myBackGroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade100,
                                                  blurRadius: 10.0,
                                                  offset: const Offset(0, 5),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  BlocProvider.of<
                                                              SalaryReportCubit>(
                                                          context)
                                                      .mothConverter[
                                                          model![index].month]
                                                      .toString(),
                                                  style: AppFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color:
                                                          MyColors.myDarkBlue,
                                                      fontSize:
                                                          kIsWeb ? 20 : 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  model![index].year,
                                                  style: AppFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color:
                                                          MyColors.myDarkBlue,
                                                      fontSize:
                                                          kIsWeb ? 20 : 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${model![index].netSalary} EGP',
                                                  style: AppFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: MyColors
                                                          .personIconColor,
                                                      fontSize:
                                                          kIsWeb ? 20 : 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          translator(context).noData,
                                          style: AppFonts.poppins(
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      )
                    : NoInternetScreen(
                        appBarTitle: translator(context).salaryReport);
              },
              child: const Center(
                child: CircularProgressIndicator(
                  color: MyColors.myWazen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
