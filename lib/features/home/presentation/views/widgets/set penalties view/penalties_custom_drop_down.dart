import 'package:flutter/material.dart';

import '../../../../../../core/constans/colors_constans.dart';

class PenaltiesCustomDropDown extends StatelessWidget {
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem<dynamic>>? items;
  final dynamic value;
  final String hint;
  final String? title;

  const PenaltiesCustomDropDown(
      {Key? key,
      required this.onChanged,
      this.title,
      required this.items,
      required this.value,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title ?? hint,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .85,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.myCyanBlue),
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton<dynamic>(
              dropdownColor: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              isExpanded: true,
              value: value,
              elevation: 16,
              underline: const SizedBox(),
              hint: Text(
                hint,
                style: const TextStyle(color: MyColors.myBlack),
              ),
              iconEnabledColor: MyColors.myBlack,
              iconDisabledColor: MyColors.myBlack,
              focusColor: Theme.of(context).colorScheme.background,
              items: items,
              onChanged: onChanged),
        ),
      ],
    );
  }
}
