import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/core/widgets/custom_appbar.dart';
import 'package:time_attendance/features/home/presentation/manage/fingetprint%20cubit/fingerprint_cubit.dart';
import 'package:time_attendance/features/home/presentation/manage/home%20cubit/home_cubit.dart';
import 'package:time_attendance/features/home/presentation/manage/notifications%20counter%20cubit/notifications_counter_cubit.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/home%20view/custom_floating_button.dart';
import 'package:time_attendance/features/home/presentation/views/widgets/home%20view/home_view_body.dart';
import 'package:time_attendance/features/menu/presentation/manage/logout%20cubit/logout_cubit.dart';
import 'package:time_attendance/features/splash/data/repo/splash_repo_impl.dart';
import '../../../../core/constans/colors_constans.dart';
import '../../../../core/helper/translator.dart';
import '../../../../core/utls/app_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    checkNotificationsCount();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      checkNotificationsCount();
      // checkUserLogin();
    }
    super.didChangeAppLifecycleState(state);
  }

  void checkUserLogin() async {
    bool isLoggedIn = await SplashRepoImpl().checkUserLogin();
    if (!isLoggedIn) {
      logout();
    }
  }

  void logout() {
    BlocProvider.of<LogoutCubit>(context).clearLocalDB();
  }

  void checkNotificationsCount() async {
    await BlocProvider.of<NotificationsCounterCubit>(context)
        .getNotificationCount();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..fetchHomeData()
            ..listenToNotification(),
        ),
        BlocProvider(create: (context) => FingerprintCubit()),
      ],
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is NotificationCounterIncreased) {
            checkNotificationsCount();
            setState(() {});
          }
        },
        child: Scaffold(
          backgroundColor: MyColors.myBackGroundColor,
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: const CustomFloatingButton(),
          appBar: CustomAppBar.customAppBar(
            onPressed: () {
              BlocProvider.of<NotificationsCounterCubit>(context)
                  .resetCounter();
              setState(() {});
              GoRouter.of(context).push(
                AppRouter.kNotificationsViewPath,
              );
            },
            text: translator(context).home,
            context: context,
            icon: Icons.notifications_none_outlined,
            customIcon:
                BlocProvider.of<NotificationsCounterCubit>(context).count != 0
                    ? Badge(
                        offset: const Offset(12, -5),
                        label: Text(
                            BlocProvider.of<NotificationsCounterCubit>(context)
                                .count
                                .toString()),
                        child: const Icon(Icons.notifications_none_outlined),
                      )
                    : null,
          ),
          body: const HomeViewBody(),
        ),
      ),
    );
  }
}
