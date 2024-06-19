import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/presentation/manage/loans%20request%20cubit/loans_request_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../data/models/loans request/financial_details_data_model.dart';
import '../permission history view/no_internet_view.dart';
import 'financial_month_details.dart';
import 'loans_history_widget.dart';

class LoansRequestViewBody extends StatefulWidget {
  const LoansRequestViewBody({Key? key}) : super(key: key);

  @override
  State<LoansRequestViewBody> createState() => _LoansRequestViewBodyState();
}

class _LoansRequestViewBodyState extends State<LoansRequestViewBody> {
  bool isLoading = true;
  FinancialDetailsData? model;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoansRequestCubit, LoansRequestState>(
      listener: (context, state) {
        if (state is LoansRequestLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is LoansRequestSuccess) {
          isLoading = false;
          model = state.model;
          setState(() {});
        } else if (state is LoansRequestFailure) {
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
          await BlocProvider.of<LoansRequestCubit>(context)
              .fetchFinancialDetailsData();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;
                return connected
                    ? Container(
                        padding: kIsWeb
                            ? const EdgeInsets.all(50)
                            : const EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.height,
                        color: MyColors.myBackGroundColor,
                        child: Column(
                          crossAxisAlignment: kIsWeb
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                          children: [
                            LoansHistoryWidget(
                              model: model,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextLoading(
                                isLoading: isLoading,
                                text: Text(
                                  translator(context).monthDetails,
                                  style: AppFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: kIsWeb ? 24 : 18,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.myDarkBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            FinancialMonthDetails(
                              model: model,
                            )
                          ],
                        ),
                      )
                    : NoInternetScreen(
                        appBarTitle: translator(context).loansRequestSent);
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
