import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/features/auth/presentation/manage/login%20cubit/login_cubit.dart';
import '../../../../../core/constans/colors_constans.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_fonts.dart';
import '../../../../../core/utls/validation.dart';
import '../../../../../core/widgets/custom_evaluated_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/my_rich_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePass = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is LoginSuccess) {
          isLoading = false;
          setState(() {});
          GoRouter.of(context).go(
            AppRouter.kBottomNavigationBarViewPath,
          );
        } else if (state is LoginFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(
            message: state.errorMessage,
          );
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: MyColors.myWhite),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                  Image.asset('assets/images/logo6.png',
                      height: MediaQuery.of(context).size.height * 0.11),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const NewMyRichText(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  SizedBox(
                    width: kIsWeb
                        ? MediaQuery.of(context).size.width * .3
                        : MediaQuery.of(context).size.width,
                    child: CustomTextFormField(
                      label: translator(context).email,
                      hint: translator(context).emailHint,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (AppValidation.isEmailValid(emailController.text)) {
                          return null;
                        } else {
                          return 'Please enter a valid email';
                        }
                      },
                      controller: emailController,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  SizedBox(
                    width: kIsWeb
                        ? MediaQuery.of(context).size.width * .3
                        : MediaQuery.of(context).size.width,
                    child: CustomTextFormField(
                      label: translator(context).password,
                      hint: translator(context).passwordHint,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (password) {
                        if (AppValidation.isPassValid(password!)) {
                          return null;
                        } else {
                          return 'Please enter a valid password';
                        }
                      },
                      obscure: hidePass,
                      controller: passwordController,
                      iconButton: IconButton(
                        icon: Icon(
                          hidePass ? Icons.visibility : Icons.visibility_off,
                          color: MyColors.myWazenLight,
                        ),
                        onPressed: () {
                          hidePass = !hidePass;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: kIsWeb
                        ? MediaQuery.of(context).size.height * .3
                        : MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kResetPasswordViewPath);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            translator(context).forgetPassword,
                            style: AppFonts.poppins(
                                textStyle: const TextStyle(
                                    color: MyColors.mainColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Visibility(
                    visible: isLoading,
                    replacement: CustomElevatedButton(
                      width: kIsWeb
                          ? MediaQuery.of(context).size.width * .03
                          : MediaQuery.of(context).size.width,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text,
                            language: "en",
                          );
                        }
                      },
                      text: translator(context).login,
                      color: MyColors.myWazenLight,
                    ),
                    child: const CircularProgressIndicator(
                      color: MyColors.myWazenLight,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
