import 'package:flutter/material.dart';

import '../../../../../../core/constans/colors_constans.dart';

class CustomListTile extends StatelessWidget {
  final double width;
  final Function()? onTap;
  final IconData icn;
  final Widget title;
  const CustomListTile(
      {super.key,
      required this.width,
      this.onTap,
      this.icn = Icons.date_range,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: MyColors.myCyanBlue),
          borderRadius: BorderRadius.circular(15),
          color: MyColors.whiteGrey),
      width: width,
      child: ListTile(
          onTap: onTap,
          trailing: Icon(icn),
          iconColor: MyColors.myWazenLight,
          title: title),
    );
  }
}
