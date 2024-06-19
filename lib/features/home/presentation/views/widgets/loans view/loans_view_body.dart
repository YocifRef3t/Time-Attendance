import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/custom_text_form_field.dart';
import 'package:time_attendance/features/home/presentation/manage/loans%20cubit/loans_request_cubit.dart';

import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';
import '../../../../../reports/presentation/views/widgets/permission history view/no_internet_view.dart';
import 'custom_radio_button.dart';

class LoansViewBody extends StatefulWidget {
  const LoansViewBody({Key? key}) : super(key: key);

  @override
  State<LoansViewBody> createState() => _LoansViewBodyState();
}

class _LoansViewBodyState extends State<LoansViewBody> {
  bool isLoading = false;
  double selectedValue = 0;
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendLoansRequestCubit, SendLoansRequestState>(
      listener: (context, state) {
        if (state is SendLoansRequestLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is SendLoansRequestSuccess) {
          ShowCustomSnackBar(context).done(message: state.message);
          GoRouter.of(context).pop();
        } else if (state is SendLoansRequestFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        } else if (state is ChangeOption) {
          selectedValue = state.value;
          setState(() {});
        }
      },
      child: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: MyColors.myBackGroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kIsWeb ? 50 : 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRadioButton(
                                width: kIsWeb
                                    ? MediaQuery.of(context).size.width * .15
                                    : MediaQuery.of(context).size.width * .4,
                                value: 1,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  BlocProvider.of<SendLoansRequestCubit>(
                                          context)
                                      .changeOption(value);
                                },
                                title: translator(context).custody,
                              ),
                              CustomRadioButton(
                                width: kIsWeb
                                    ? MediaQuery.of(context).size.width * .15
                                    : MediaQuery.of(context).size.width * .4,
                                value: 2,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  BlocProvider.of<SendLoansRequestCubit>(
                                          context)
                                      .changeOption(value);
                                },
                                title: translator(context).loan,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kIsWeb ? 50 : 20,
                          ),
                          SizedBox(
                            width: kIsWeb
                                ? MediaQuery.of(context).size.width * .4
                                : MediaQuery.of(context).size.width,
                            child: CustomNumTextFormField(
                              sizedBoxHeight:
                                  MediaQuery.of(context).size.height * .015,
                              controller: amountController,
                              hint: translator(context).amount,
                              num: 1,
                              type: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            height: kIsWeb ? 50 : 20,
                          ),
                          SizedBox(
                            width: kIsWeb
                                ? MediaQuery.of(context).size.width * .4
                                : MediaQuery.of(context).size.width,
                            child: CustomNumTextFormField(
                                sizedBoxHeight:
                                    MediaQuery.of(context).size.height * .015,
                                controller: descriptionController,
                                hint: translator(context).description,
                                num: 5,
                                type: TextInputType.text),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const SizedBox(height: 60),
                          Visibility(
                            visible: isLoading,
                            replacement: CustomElevatedButton(
                              width: kIsWeb
                                  ? MediaQuery.of(context).size.width * .05
                                  : MediaQuery.of(context).size.width * .6,
                              onPressed: () {
                                BlocProvider.of<SendLoansRequestCubit>(context)
                                    .sendLoanRequest(
                                  amount: amountController.text,
                                  type: selectedValue.toString(),
                                  description: descriptionController.text,
                                );
                              },
                              text: translator(context).submit,
                            ),
                            child: const CircularProgressIndicator(),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : NoInternetScreen(appBarTitle: translator(context).loan);
        },
        child: const Center(
          child: CircularProgressIndicator(
            color: MyColors.myWazen,
          ),
        ),
      ),
    );
  }
}
