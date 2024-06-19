import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/features/reports/data/models/penalties%20report/penalties_report_model.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../manage/penalties report cubit/penalties_report_cubit.dart';

class PenaltiesDialog extends StatelessWidget {
  const PenaltiesDialog({
    super.key,
    required this.model,
    required this.rejectReason,
  });

  final PenaltiesReportModel model;
  final TextEditingController rejectReason;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      title: Center(
        child: Text(translator(context).penalty),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () async {
                BlocProvider.of<PenaltiesReportCubit>(context).sendGrievance(
                  id: "${model.id}",
                  decoration: rejectReason.text,
                );
              },
              text: translator(context).grievance,
              color: MyColors.myWazenLight,
              width: 150,
            ),
          ],
        )
      ],
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .35,
        child: Column(
          children: [
            model.deductionKind == "1"
                ? Text("${model.penaltiesDtlsDscAr}")
                : Text("${model.penaltyType}"),
            CustomNumTextFormField(
              controller: rejectReason,
              hint: translator(context).rejectReason,
              num: 3,
              type: TextInputType.text,
              sizedBoxHeight: 20,
            )
          ],
        ),
      ),
    );
  }
}
