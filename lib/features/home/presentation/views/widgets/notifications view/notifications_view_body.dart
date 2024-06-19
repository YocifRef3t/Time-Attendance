import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/loading/list_loading.dart';
import 'package:time_attendance/features/home/presentation/manage/notification%20cubit/notification_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/notifications%20view/notification_item.dart';

import '../../../../data/models/notification_model.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  List<NotificationModel>? notifications;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is NotificationLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is NotificationSuccess) {
          isLoading = false;
          notifications = state.notifications;
          setState(() {});
        } else if (state is NotificationFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: !isLoading
          ? notifications!.isEmpty
              ? Center(
                  child: Text(translator(context).noData),
                )
              : SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: notifications!.length,
                    itemBuilder: (context, index) => NotificationItem(
                      model: notifications![index],
                    ),
                  ),
                )
          : const ListLoading(),
    );
  }
}
