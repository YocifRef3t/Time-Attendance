import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/custom_text_form_field.dart';
import 'package:time_attendance/features/menu/presentation/manage/privacy%20cubit/privacy_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';
import '../../../../../../core/constans/validation.dart';
import '../../../../../../core/helper/translator.dart';
import '../../../../../../core/widgets/custom_evaluated_button.dart';

class PrivacyViewBody extends StatefulWidget {
  const PrivacyViewBody({Key? key}) : super(key: key);
  @override
  State<PrivacyViewBody> createState() => _PrivacyViewBodyState();
}

class _PrivacyViewBodyState extends State<PrivacyViewBody>
    with InputValidationMixin {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmationController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PrivacyCubit, PrivacyState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is ChangePasswordSuccess) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).done(message: state.message);
          GoRouter.of(context).pop();
        } else if (state is ChangePasswordFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MyColors.myBackGroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: kIsWeb
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    translator(context).changePassword,
                    style: AppFonts.poppins(
                      textStyle: const TextStyle(
                        color: MyColors.myDarkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  kIsWeb
                      ? Center(
                          child: Image.asset(
                            'assets/images/change_password_image.png',
                            width: 250,
                            height: 250,
                          ),
                        )
                      : Image.asset(
                          'assets/images/change_password_image.png',
                        ),
                  const SizedBox(height: 24),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: kIsWeb
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        kIsWeb
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: CustomTextFormField(
                                  label: translator(context).changePassword,
                                  hint: translator(context).currentPasswordHint,
                                  validator: (password) {
                                    if (isPassValid(password!)) {
                                      return null;
                                    } else {
                                      return 'Password Limit';
                                    }
                                  },
                                  controller: currentPasswordController,
                                  obscure: hidePassword,
                                  iconButton: IconButton(
                                    icon: Icon(
                                      hidePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: MyColors.myWazenLight,
                                    ),
                                    onPressed: () {
                                      hidePassword = !hidePassword;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : CustomTextFormField(
                                label: translator(context).currentPassword,
                                hint: translator(context).currentPasswordHint,
                                validator: (password) {
                                  if (isPassValid(password!)) {
                                    return null;
                                  } else {
                                    return 'Password Limit';
                                  }
                                },
                                controller: currentPasswordController,
                                obscure: hidePassword,
                                iconButton: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: MyColors.myWazenLight,
                                  ),
                                  onPressed: () {
                                    hidePassword = !hidePassword;
                                    setState(() {});
                                  },
                                ),
                              ),
                        const SizedBox(height: 30),
                        kIsWeb
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: CustomTextFormField(
                                  label: translator(context).newPassword,
                                  hint: translator(context).newPasswordHint,
                                  validator: (password) {
                                    if (isPassValid(password!)) {
                                      return null;
                                    } else {
                                      return 'Password Limit';
                                    }
                                  },
                                  controller: newPasswordController,
                                  obscure: hidePassword,
                                  iconButton: IconButton(
                                    icon: Icon(
                                      hidePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: MyColors.myWazenLight,
                                    ),
                                    onPressed: () {
                                      hidePassword = !hidePassword;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : CustomTextFormField(
                                label: translator(context).newPassword,
                                hint: translator(context).newPasswordHint,
                                validator: (password) {
                                  if (isPassValid(password!)) {
                                    return null;
                                  } else {
                                    return 'Password Limit';
                                  }
                                },
                                controller: newPasswordController,
                                obscure: hidePassword,
                                iconButton: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: MyColors.myWazenLight,
                                  ),
                                  onPressed: () {
                                    hidePassword = !hidePassword;
                                    setState(() {});
                                  },
                                ),
                              ),
                        const SizedBox(
                          height: 30,
                        ),
                        kIsWeb
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: CustomTextFormField(
                                  label:
                                      translator(context).passwordConfirmation,
                                  hint: translator(context)
                                      .passwordConfirmationHint,
                                  validator: (newPassword) {
                                    if (isPassValid(newPassword!)) {
                                      return null;
                                    } else {
                                      return 'Password Limit';
                                    }
                                  },
                                  controller: newPasswordConfirmationController,
                                  obscure: hidePassword,
                                  iconButton: IconButton(
                                    icon: Icon(
                                      hidePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: MyColors.myWazenLight,
                                    ),
                                    onPressed: () {
                                      hidePassword = !hidePassword;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            : CustomTextFormField(
                                label: translator(context).passwordConfirmation,
                                hint: translator(context)
                                    .passwordConfirmationHint,
                                validator: (newPassword) {
                                  if (isPassValid(newPassword!)) {
                                    return null;
                                  } else {
                                    return 'Password Limit';
                                  }
                                },
                                controller: newPasswordConfirmationController,
                                obscure: hidePassword,
                                iconButton: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: MyColors.myWazenLight,
                                  ),
                                  onPressed: () {
                                    hidePassword = !hidePassword;
                                    setState(() {});
                                  },
                                ),
                              ),
                        const SizedBox(height: 40),
                        Visibility(
                          visible: isLoading,
                          replacement: CustomElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<PrivacyCubit>(context)
                                    .changePassword(
                                  currentPassword:
                                      currentPasswordController.text,
                                  password: newPasswordController.text,
                                  conPassword:
                                      newPasswordConfirmationController.text,
                                );
                              }
                            },
                            text: translator(context).save,
                            width: kIsWeb
                                ? 100
                                : MediaQuery.of(context).size.width * .75,
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
