import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../ask for permission view/custom_list_tile.dart';

class DateWidget extends StatelessWidget {
  final double dWidth;
  final String label;
  final String hint;
  final VoidCallback onTap;
  final IconData icon;

  const DateWidget(
      {super.key,
      required this.dWidth,
      required this.onTap,
      required this.hint,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        CustomListTile(
          icn: icon,
          onTap: onTap,
          title: Text(
            hint,
            style: const TextStyle(
              fontSize: kIsWeb ? 18 : 14,
              color: MyColors.myBlack,
            ),
          ),
          width: MediaQuery.of(context).size.width * dWidth,
        ),
      ],
    );
  }
}
