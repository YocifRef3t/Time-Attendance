import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/loading/container_loading.dart';
import 'package:time_attendance/features/reports/data/models/permissions%20history/permissions_history_model.dart';
import 'package:time_attendance/features/reports/presentation/manage/permissions%20cubit/permissions_cubit.dart';

import '../../../../../../core/helper/translator.dart';
import 'permission_month_filter_widget.dart';

class PermissionDetailsWidget extends StatelessWidget {
  final PermissionsHistoryModel? model;
  const PermissionDetailsWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          const PermissionMonthFilterWidget(),
          Center(
            child: BlocBuilder<PermissionsCubit, PermissionsState>(
              builder: (context, state) {
                if (state is PermissionsLoading) {
                  return ContainerLoading(
                    width: MediaQuery.of(context).size.width * .5,
                    height: 70,
                  );
                }
                return Container(
                  width: kIsWeb
                      ? MediaQuery.of(context).size.width * .2
                      : MediaQuery.of(context).size.width * .5,
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
                              translator(context).permissionsCount,
                              style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: kIsWeb ? 18 : 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(16, 165, 128, 1),
                                ),
                              ),
                            )
                          ],
                        ),
                        kIsWeb ? const SizedBox(height: 50) : const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            model != null
                                ? Text(
                                    model!.requestsCount.toString(),
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
                                  )
                                : const SizedBox()
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
