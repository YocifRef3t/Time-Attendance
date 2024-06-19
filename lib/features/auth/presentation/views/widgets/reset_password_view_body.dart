import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/custom_evaluated_button.dart';
import 'package:time_attendance/features/auth/presentation/manage/reset%20password%20cubit/reset_password_cubit.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is ResetPasswordSuccess) {
          isLoading = false;
          setState(() {});
          GoRouter.of(context).pop();
          ShowCustomSnackBar(context).done(message: state.message);
        } else if (state is ResetPasswordFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                label: translator(context).email,
                hint: translator(context).emailHint,
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email == null) {
                    return translator(context).validDataErrorMessage;
                  }
                  if (email.isEmpty) {
                    return translator(context).validDataErrorMessage;
                  } else {
                    return null;
                  }
                },
                controller: emailController,
              ),
              const SizedBox(height: 24),
              Visibility(
                visible: isLoading,
                replacement: CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<ResetPasswordCubit>(context)
                          .resetPassword(
                        email: emailController.text,
                      );
                    }
                  },
                  text: translator(context).reset,
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
