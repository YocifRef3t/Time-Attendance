import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/container_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/loans%20request%20cubit/loans_request_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../data/models/loans request/financial_details_data_model.dart';
import 'financial_month_filter.dart';

class LoansHistoryWidget extends StatelessWidget {
  final FinancialDetailsData? model;
  const LoansHistoryWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            const FinancialMonthFilter(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            BlocBuilder<LoansRequestCubit, LoansRequestState>(
              builder: (context, state) {
                if (state is LoansRequestLoading) {
                  return const ContainerLoading(
                    height: 150,
                  );
                }
                return StaggeredGrid.count(
                  crossAxisCount: kIsWeb ? 4 : 10,
                  mainAxisSpacing: kIsWeb ? 4 : 5,
                  crossAxisSpacing: kIsWeb ? 4 : 10,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 5,
                      mainAxisCellCount: kIsWeb ? .5 : 2.5,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(232, 249, 252, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translator(context).loansNumber,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: kIsWeb ? 16 : 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(
                                            16,
                                            165,
                                            128,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      model!.advancePaymentCount.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: kIsWeb ? 20 : 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(
                                            16,
                                            165,
                                            128,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 5,
                      mainAxisCellCount: kIsWeb ? .5 : 2.5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF0090A8),
                              Color(0xFF00C5Bc),
                              Color(0xFF00D9DA),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translator(context).loansTotal,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: kIsWeb ? 16 : 14,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.myWhite),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    model!.advancePaymentAmount.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 22 : 16,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.myWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 5,
                      mainAxisCellCount: kIsWeb ? .5 : 2.5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(249, 239, 255, 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translator(context).custodyCount,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 16 : 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(
                                          126,
                                          20,
                                          148,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    model!.custodyCount.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 20 : 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(
                                          122,
                                          13,
                                          132,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: kIsWeb ? 1 : 5,
                      mainAxisCellCount: kIsWeb ? .5 : 2.5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF0090A8),
                              Color(0xFF00C5Bc),
                              Color(0xFF00D9DA),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translator(context).custodyTotal,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 16 : 14,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.myWhite,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    model!.custodyAmount.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 22 : 16,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.myWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
