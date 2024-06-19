import 'package:flutter/material.dart';

import '../../../../../../core/constans/colors_constans.dart';

class HistoryRowWidget extends StatelessWidget {
  final String title;
  final String content;
  const HistoryRowWidget({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: MyColors.myCyanBlue),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          content,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: MyColors.myWazenLight),
        ),
      ],
    );
  }
}
