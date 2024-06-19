import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/widgets/custom_evaluated_button.dart';
import 'package:time_attendance/features/menu/presentation/manage/logout%20cubit/logout_cubit.dart';

class CustomDialogView extends StatefulWidget {
  final OverlayEntry? entry;
  const CustomDialogView({super.key, required this.entry});

  @override
  State<CustomDialogView> createState() => _CustomDialogViewState();
}

class _CustomDialogViewState extends State<CustomDialogView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: double.maxFinite,
          height: 170,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/logout.gif",
                height: 130,
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        translator(context).loggedOut,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: AppFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                      Row(
                        children: [
                          const Spacer(),
                          Visibility(
                            visible: isLoading,
                            replacement: CustomElevatedButton(
                              onPressed: () async {
                                isLoading = true;
                                setState(() {});
                                await BlocProvider.of<LogoutCubit>(context)
                                    .clearLocalDB();
                                widget.entry?.remove();
                              },
                              text: translator(context).ok,
                              width: 80,
                              height: 20,
                            ),
                            child: const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
