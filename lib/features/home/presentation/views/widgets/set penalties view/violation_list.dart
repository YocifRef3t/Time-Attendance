import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/features/home/presentation/manage/set%20penalty%20cubit/set_penalty_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/set%20penalties%20view/set_penalties_data.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../data/models/penalties_details_model.dart';
import 'penalties_custom_drop_down.dart';

class ViolationList extends StatefulWidget {
  final PenaltiesDetailsModel model;
  const ViolationList({super.key, required this.model});
  @override
  State<ViolationList> createState() => _ViolationListState();
}

class _ViolationListState extends State<ViolationList> with SetPenaltiesData {
  int? violationItem;
  int? repeatItem;
  String? punshNo;
  String? penaltyItem;
  String? idNo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PenaltiesCustomDropDown(
          onChanged: (value) {
            violationItem = value;
            penaltyItem = widget.model.cmpPenals!
                .firstWhere(
                  (element) {
                    return element.penaltiesNo == violationItem;
                  },
                )
                .details!
                .firstWhere(
                  (element) {
                    if (element.penaltiesNo == violationItem) {
                      punshNo = element.penaltiesNo.toString();
                      idNo = element.iDNo.toString();
                      return true;
                    } else {
                      return false;
                    }
                  },
                )
                .penaltiesDscAr;
            BlocProvider.of<SetPenaltyCubit>(context).punshNo = punshNo;
            BlocProvider.of<SetPenaltyCubit>(context).idNo = idNo;
            setState(() {});
          },
          items: getViolationList(widget.model),
          value: violationItem,
          hint: translator(context).violationList,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        violationItem != null
            ? PenaltiesCustomDropDown(
                onChanged: (value) {},
                items: const [],
                value: 0.0,
                title: translator(context).penaltiesType,
                hint: penaltyItem ?? translator(context).penaltiesType,
              )
            : const SizedBox(),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        PenaltiesCustomDropDown(
          onChanged: (value) {
            repeatItem = value;
            BlocProvider.of<SetPenaltyCubit>(context).punshRepeat = value;
            setState(() {});
          },
          items: getPenaltyRepeat(context),
          value: repeatItem,
          hint: translator(context).chooseRepeat,
        ),
      ],
    );
  }
}
