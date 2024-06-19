import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/loans%20request%20cubit/loans_request_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../data/models/loans request/financial_details_data_model.dart';

class FinancialMonthDetails extends StatelessWidget {
  final FinancialDetailsData? model;
  const FinancialMonthDetails({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoansRequestCubit, LoansRequestState>(
      builder: (context, state) {
        if (state is LoansRequestLoading) {
          return const ListLoading();
        }
        return model!.financialData.isNotEmpty
            ? Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: MyColors.myBackGroundColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 10.0,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                model!.financialData[index].date,
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: MyColors.myDarkBlue,
                                    fontSize: kIsWeb ? 18 : 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                '${model!.financialData[index].amount} SAR',
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: MyColors.myDarkBlue,
                                    fontSize: kIsWeb ? 18 : 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                model!.financialData[index].typeName,
                                style: AppFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: MyColors.myDarkBlue,
                                    fontSize: kIsWeb ? 18 : 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: MyColors.attendanceBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // width: 80,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    model!.financialData[index].requestStage,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: MyColors.personIconColor,
                                        fontSize: kIsWeb ? 20 : 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      physics: const BouncingScrollPhysics(),
                      itemCount: model!.financialData.length,
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  'No Financial',
                  style: AppFonts.poppins(
                    textStyle: const TextStyle(
                      color: MyColors.myDarkBlue,
                      fontSize: kIsWeb ? 20 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
