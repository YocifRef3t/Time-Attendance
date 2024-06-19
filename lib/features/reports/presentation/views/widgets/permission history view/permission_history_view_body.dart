import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/text_loading.dart';
import 'package:time_attendance/features/reports/data/models/permissions%20history/permissions_history_model.dart';
import 'package:time_attendance/features/reports/presentation/manage/permissions%20cubit/permissions_cubit.dart';
import 'package:time_attendance/features/reports/presentation/views/widgets/permission%20history%20view/no_internet_view.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import 'pemission_details_widget.dart';
import 'permission_month_details.dart';

class PermissionHistoryViewBody extends StatefulWidget {
  const PermissionHistoryViewBody({Key? key}) : super(key: key);

  @override
  State<PermissionHistoryViewBody> createState() =>
      _PermissionHistoryViewBodyState();
}

class _PermissionHistoryViewBodyState extends State<PermissionHistoryViewBody> {
  bool isLoading = true;
  PermissionsHistoryModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionsCubit, PermissionsState>(
        listener: (context, state) {
          if (state is PermissionsLoading) {
            isLoading = true;
            setState(() {});
          } else if (state is PermissionsSuccess) {
            isLoading = false;
            model = state.model;
            setState(() {});
          } else if (state is PermissionsFailure) {
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
            await BlocProvider.of<PermissionsCubit>(context)
                .fetchPermissionsHistory();
          },
          child: ListView(
            children: [
              OfflineBuilder(
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return connected
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          color: MyColors.myBackGroundColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PermissionDetailsWidget(
                                model: model,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: TextLoading(
                                  isLoading: isLoading,
                                  text: Text(
                                    translator(context).monthDetails,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: kIsWeb ? 22 : 18,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.myDarkBlue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              PermissionMonthDetails(
                                model: model,
                              ),
                            ],
                          ),
                        )
                      : NoInternetScreen(
                          appBarTitle: translator(context).permissionsHistory);
                },
                child: const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.myWazen,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
