import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:time_attendance/core/constans/database_constans.dart';
import 'package:time_attendance/core/models/employee_model.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import 'package:time_attendance/features/menu/presentation/manage/logout%20cubit/logout_cubit.dart';
import 'package:time_attendance/features/splash/data/repo/splash_repo_impl.dart';
import '../../../../../core/constans/colors_constans.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      BlocProvider.of<LogoutCubit>(context).initPusher();
      bool isLoggedIn = await SplashRepoImpl().checkUserLogin();
      if (checkLogin() && isLoggedIn) {
        customNavigation(AppRouter.kBottomNavigationBarViewPath);
      } else {
        customNavigation(AppRouter.kLoginViewPath);
      }
    });
    super.initState();
  }

  void customNavigation(String route) {
    GoRouter.of(context).push(route);
  }

  bool checkLogin() {
    var box = Hive.box<EmployeeModel>(kEmployeeBox);
    var data = box.values.toList();
    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.myBackGroundColor,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .35,
            ),
            Image.asset(
              'assets/images/logo6.png',
              height: MediaQuery.of(context).size.height * 0.11,
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Infosas Hr',
                  textStyle: const TextStyle(
                      color: MyColors.myWazenLight,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900),
                  speed: const Duration(
                    milliseconds: 200,
                  ),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
      ),
    );
  }
}
