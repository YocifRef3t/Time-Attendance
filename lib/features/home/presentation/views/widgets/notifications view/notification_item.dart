import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:time_attendance/core/constans/colors_constans.dart';
import 'package:time_attendance/features/home/data/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel model;

  const NotificationItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          color: MyColors.earlyArrivalBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ListTile(
        title: Text(
          model.title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            formatDate(model.time, [yyyy, '-', m, '-', d]),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Text(
          getTime(model.time),
          overflow: TextOverflow.ellipsis,
        ),
        leading: Container(
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(
            color: MyColors.myWazenLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  String getTime(DateTime time) {
    return "${time.hour}:${time.minute}";
  }
}
