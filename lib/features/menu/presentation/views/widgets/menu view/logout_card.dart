import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/utls/app_fonts.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/features/menu/presentation/manage/logout%20cubit/logout_cubit.dart';
import '../../../../../../core/constans/colors_constans.dart';

class LogoutCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color backGroundColor;
  final String title;

  const LogoutCard(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.backGroundColor,
      required this.title})
      : super(key: key);

  @override
  State<LogoutCard> createState() => _LogoutCardState();
}

class _LogoutCardState extends State<LogoutCard> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is LogoutSuccess) {
          isLoading = false;
          setState(() {});
          while (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          }
          GoRouter.of(context).pushReplacement(AppRouter.kLoginViewPath);
        } else if (state is LogoutFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
      },
      child: InkWell(
        onTap: () {
          BlocProvider.of<LogoutCubit>(context).logout();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: kIsWeb
                ? MediaQuery.of(context).size.width * .4
                : MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.backGroundColor),
                  width: kIsWeb ? 25 : 50,
                  height: kIsWeb ? 25 : 50,
                  child: Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: kIsWeb ? 60 : 30,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.title,
                  style: AppFonts.poppins(
                    textStyle: const TextStyle(
                      color: MyColors.myDarkBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: kIsWeb ? 20 : 16,
                    ),
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: isLoading,
                  child: const SizedBox(
                    width: 17,
                    height: 17,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: MyColors.myWazenLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
