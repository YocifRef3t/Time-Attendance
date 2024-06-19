import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/home/presentation/manage/notification%20cubit/notification_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/notifications%20view/notifications_view_body.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()
        ..fetchNotifications()
        ..readAllNotifications(),
      child: Scaffold(
        appBar: CustomAppBar.customAppBar(
          text: translator(context).notifications,
          context: context,
        ),
        body: const NotificationsViewBody(),
      ),
    );
  }
}
