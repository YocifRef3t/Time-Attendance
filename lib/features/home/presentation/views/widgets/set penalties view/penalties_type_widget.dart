import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/widgets/custom_text_form_field.dart';
import 'package:time_attendance/features/home/presentation/manage/set%20penalty%20cubit/set_penalty_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/set%20penalties%20view/penalties_custom_drop_down.dart';

import '../../../../../../core/helper/translator.dart';
import 'set_penalties_data.dart';

class PenaltiesTypeWidget extends StatefulWidget {
  final TextEditingController statementController;
  final TextEditingController amountController;
  final TextEditingController warningController;

  const PenaltiesTypeWidget({
    super.key,
    required this.statementController,
    required this.amountController,
    required this.warningController,
  });

  @override
  State<PenaltiesTypeWidget> createState() => _PenaltiesTypeWidgetState();
}

class _PenaltiesTypeWidgetState extends State<PenaltiesTypeWidget>
    with SetPenaltiesData {
  String? penaltyType;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SetPenaltyCubit, SetPenaltyState>(
      listener: (context, state) {
        if (state is PenaltyTypeChanged) {
          penaltyType = state.value;
          setState(() {});
        }
      },
      child: Column(
        children: [
          PenaltiesCustomDropDown(
            onChanged: (value) {
              BlocProvider.of<SetPenaltyCubit>(context)
                  .penaltyTypeChange(value);
            },
            items: getPenaltiesType(context),
            value: penaltyType,
            hint: translator(context).penaltiesType,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          CustomNumTextFormField(
            sizedBoxHeight: MediaQuery.of(context).size.height * .015,
            controller: widget.statementController,
            hint: translator(context).violationStatement,
            num: 1,
            type: TextInputType.text,
          ),
          CustomNumTextFormField(
            sizedBoxHeight: MediaQuery.of(context).size.height * .015,
            controller: widget.amountController,
            hint: translator(context).violationAmount,
            num: 1,
            type: TextInputType.number,
          ),
          CustomNumTextFormField(
            sizedBoxHeight: MediaQuery.of(context).size.height * .015,
            controller: widget.warningController,
            hint: translator(context).warningMessage,
            num: 1,
            type: TextInputType.text,
          ),
        ],
      ),
    );
  }
}

/*
 required BuildContext context,
  required TextEditingController statementController,
  required TextEditingController amountController ,
  required TextEditingController warningController ,
*/