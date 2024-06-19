import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:time_attendance/core/utls/custom_snack_bar.dart';
import 'package:time_attendance/core/widgets/dialog/custom_dialog.dart';
import 'package:time_attendance/features/auth/presentation/manage/login%20cubit/login_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/home_view.dart';
import 'package:time_attendance/features/menu/presentation/manage/logout%20cubit/logout_cubit.dart';
import 'package:time_attendance/features/menu/presentation/views/menu_view.dart';
import 'package:time_attendance/features/reports/presentation/views/report_view.dart';
import '../../../../core/constans/colors_constans.dart';
import '../../../../core/helper/translator.dart';
import '../../../../core/utls/app_router.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  PersistentTabController persistentTabControllerController =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const ReportView(),
      const MenuView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: (translator(context).home),
        activeColorPrimary: MyColors.myWazenLight,
        inactiveColorPrimary: MyColors.myGreyLight,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.assignment),
        title: (translator(context).reports),
        activeColorPrimary: MyColors.myWazenLight,
        inactiveColorPrimary: MyColors.myGreyLight,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu),
        title: (translator(context).menu),
        activeColorPrimary: MyColors.myWazenLight,
        inactiveColorPrimary: MyColors.myGreyLight,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is FetchProfileDataFailure) {
            ShowCustomSnackBar(context).failure(
              message: "Faild to fitch profile data\n${state.errorMessage}",
            );
          }
        },
        child: BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutListen) {
              CustomDialog(context).show();
            } else if (state is LogoutSuccess) {
              while (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              }
              GoRouter.of(context).pushReplacement(AppRouter.kLoginViewPath);
            }
          },
          child: Scaffold(
            backgroundColor: MyColors.myBackGroundColor,
            body: PersistentTabView(
              context,
              controller: persistentTabControllerController,
              screens: _buildScreens(),
              items: _navBarsItems(),
              confineInSafeArea: true,
              backgroundColor: MyColors.myWhite, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows:
                  true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: MyColors.myWhite,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle
                  .style6, // Choose the nav bar style with this property.
            ),
          ),
        ),
      ),
    );
  }
}
