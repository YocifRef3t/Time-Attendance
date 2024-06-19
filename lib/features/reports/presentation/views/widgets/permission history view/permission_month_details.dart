import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/features/reports/data/models/permissions%20history/permissions_history_model.dart';
import 'package:time_attendance/features/reports/presentation/manage/permissions%20cubit/permissions_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';

class PermissionMonthDetails extends StatelessWidget {
  final PermissionsHistoryModel? model;
  const PermissionMonthDetails({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model != null
        ? model!.permissions.isNotEmpty
            ? Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: BlocBuilder<PermissionsCubit, PermissionsState>(
                      builder: (context, state) {
                        if (state is PermissionsLoading) {
                          return const ListLoading();
                        }
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          shrinkWrap: true,
                          itemCount: model!.requestsCount,
                          physics: const BouncingScrollPhysics(),
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
                                      offset: const Offset(0, 5),
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model!.permissions[index].dateFrom,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: MyColors.myDarkBlue,
                                        fontSize: kIsWeb ? 18 : 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    model!.permissions[index].typeOfPermission,
                                    style: AppFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: MyColors.myDarkBlue,
                                        fontSize: kIsWeb ? 18 : 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: MyColors.attendanceBackgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    // width: 80,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        model!.permissions[index].requestStage,
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
                        );
                      },
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  'No Permissions',
                  style: AppFonts.poppins(
                    textStyle: const TextStyle(
                      color: MyColors.myDarkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
        : const ListLoading();
  }
}
