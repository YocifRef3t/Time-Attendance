import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/constans/database_constans.dart';
import 'package:time_attendance/core/helper/get_user_settings_data.dart';
import 'package:time_attendance/core/models/employee_model.dart';
import 'package:time_attendance/core/models/profile_data.dart';
import 'package:time_attendance/core/models/user_settings_model.dart';
import 'package:time_attendance/core/network/notifications.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import 'package:time_attendance/features/menu/presentation/manage/language%20cubit/language_cubit.dart';
import 'package:time_attendance/features/menu/presentation/manage/logout%20cubit/logout_cubit.dart';
import 'package:time_attendance/features/menu/presentation/manage/profile%20cubit/profile_cubit.dart';
import 'package:time_attendance/features/reports/presentation/manage/penalties%20report%20cubit/penalties_report_cubit.dart';
import 'package:time_attendance/firebase_options.dart';
import 'features/home/presentation/manage/notifications counter cubit/notifications_counter_cubit.dart';
import 'generated/l10n.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: '',
  importance: Importance.max,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initNotification();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeModelAdapter());
  Hive.registerAdapter(ProfileDataModelAdapter());
  Hive.registerAdapter(UserSettingsModelAdapter());
  await Hive.openBox<EmployeeModel>(kEmployeeBox);
  await Hive.openBox<ProfileDataModel>(kProfileDateBox);
  await Hive.openBox<UserSettingsModel>(kUserSettingsBox);
  FlutterDynamicIcon.setApplicationIconBadgeNumber(0);
  runApp(const TimeAttendance());
}

class TimeAttendance extends StatefulWidget {
  const TimeAttendance({super.key});
  @override
  State<TimeAttendance> createState() => _TimeAttendanceState();
}

class _TimeAttendanceState extends State<TimeAttendance> {
  String languageCode =
      GetUserSettingsData().language ?? Intl.getCurrentLocale();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => PenaltiesReportCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => NotificationsCounterCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
      ],
      child: BlocListener<LanguageCubit, LanguageState>(
        listener: (context, state) {
          if (state is LanguageChanged) {
            languageCode = state.languageCode;
            setState(() {});
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: Locale(languageCode),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: "IS HR",
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
