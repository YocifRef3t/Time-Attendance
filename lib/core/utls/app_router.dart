import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_attendance/features/home/presentation/views/ask_for_permission_view.dart';
import 'package:time_attendance/features/home/presentation/views/late_attendance_request_view.dart';
import 'package:time_attendance/features/home/presentation/views/loans_view.dart';
import 'package:time_attendance/features/home/presentation/views/notifications_view.dart';
import 'package:time_attendance/features/home/presentation/views/set_penalties_view.dart';
import 'package:time_attendance/features/home/presentation/views/vacation_request_view.dart';
import 'package:time_attendance/features/menu/presentation/views/about_view.dart';
import 'package:time_attendance/features/menu/presentation/views/attendance_history_view.dart';
import 'package:time_attendance/features/menu/presentation/views/change_language_view.dart';
import 'package:time_attendance/features/menu/presentation/views/privacy_view.dart';
import 'package:time_attendance/features/menu/presentation/views/profile_view.dart';
import 'package:time_attendance/features/reports/presentation/views/insurance_view.dart';
import 'package:time_attendance/features/reports/presentation/views/loans_request_view.dart';
import 'package:time_attendance/features/reports/presentation/views/location_view.dart';
import 'package:time_attendance/features/reports/presentation/views/over_time_view.dart';
import 'package:time_attendance/features/reports/presentation/views/penalties_view.dart';
import 'package:time_attendance/features/reports/presentation/views/permission_history_view.dart';
import 'package:time_attendance/features/reports/presentation/views/report_view.dart';
import 'package:time_attendance/features/reports/presentation/views/salary_report_view.dart';
import 'package:time_attendance/features/reports/presentation/views/vacation_history_view.dart';
import 'package:time_attendance/features/splash/presentation/views/splash_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/home/presentation/views/bottom_navigation_bar.dart';

abstract class AppRouter {
  static const kLoginViewPath = "/LoginViewPath";
  static const kBottomNavigationBarViewPath = "/BottomNavigationBarViewPath";
  static const kProfileViewPath = "/ProfileViewPath";
  static const kPrivacyViewPath = "/PrivacyViewPath";
  static const kAttendanceHistory = "/AttendanceHistory";
  static const kLoansRequestViewPath = "/LoansRequestViewPath";
  static const kOverTimeViewPath = "/OverTimeViewPath";
  static const kPenaltiesViewPath = "/PenaltiesViewPath";
  static const kPermissionsHistoryViewPath = "/PermissionsHistoryViewPath";
  static const kReportViewPath = "/ReportViewPath";
  static const kSalaryReportViewPath = "/SalaryReportViewPath";
  static const kVacationHistoryViewPath = "/VacationHistoryViewPath";
  static const kChangeLanguageViewPath = "/ChangeLanguageViewPath";
  static const kAskForPermissionsViewPath = "/AskForPermissionsViewPath";
  static const kLoansViewPath = "/LoansViewPath";
  static const kVacationRequestViewPath = "/VacationRequestViewPath";
  static const kLateAttendanceRequestViewPath =
      "/LateAttendanceRequestViewPath";
  static const kSetPenaltiesViewPath = "/SetPenaltiesViewPath";
  static const kAboutViewPath = "/AboutViewPath";
  static const kResetPasswordViewPath = "/ResetPasswordViewPath";
  static const kNotificationsViewPath = "/NotificationsViewPath";
  static const kInsuranceViewPath = "/InsuranceViewPath";
  static const kLocationViewPath = "/LocationViewPath";

  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    navigatorKey: navKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginViewPath,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kBottomNavigationBarViewPath,
        builder: (context, state) => const BottomNavigationBarView(),
      ),
      GoRoute(
        path: kProfileViewPath,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kPrivacyViewPath,
        builder: (context, state) => const PrivacyView(),
      ),
      GoRoute(
        path: kAttendanceHistory,
        builder: (context, state) => const AttendanceHistoryView(),
      ),
      GoRoute(
        path: kLoansRequestViewPath,
        builder: (context, state) => const LoansRequestView(),
      ),
      GoRoute(
        path: kOverTimeViewPath,
        builder: (context, state) => const OverTimeView(),
      ),
      GoRoute(
        path: kPenaltiesViewPath,
        builder: (context, state) => const PenaltiesView(),
      ),
      GoRoute(
        path: kPermissionsHistoryViewPath,
        builder: (context, state) => const PermissionHistoryView(),
      ),
      GoRoute(
        path: kReportViewPath,
        builder: (context, state) => const ReportView(),
      ),
      GoRoute(
        path: kSalaryReportViewPath,
        builder: (context, state) => const SalaryReportView(),
      ),
      GoRoute(
        path: kVacationHistoryViewPath,
        builder: (context, state) => const VacationHistoryView(),
      ),
      GoRoute(
        path: kChangeLanguageViewPath,
        builder: (context, state) => const ChangeLanguageView(),
      ),
      GoRoute(
        path: kAskForPermissionsViewPath,
        builder: (context, state) => const AskForPermissionView(),
      ),
      GoRoute(
        path: kLoansViewPath,
        builder: (context, state) => const LoansView(),
      ),
      GoRoute(
        path: kVacationRequestViewPath,
        builder: (context, state) => const VacationRequestView(),
      ),
      GoRoute(
        path: kLateAttendanceRequestViewPath,
        builder: (context, state) => const LateAttendanceRequestView(),
      ),
      GoRoute(
        path: kSetPenaltiesViewPath,
        builder: (context, state) => const SetPenaltiesView(),
      ),
      GoRoute(
        path: kAboutViewPath,
        builder: (context, state) => const AboutView(),
      ),
      GoRoute(
        path: kResetPasswordViewPath,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kNotificationsViewPath,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: kInsuranceViewPath,
        builder: (context, state) => const InsuranceView(),
      ),
      GoRoute(
        path: kLocationViewPath,
        builder: (context, state) => const LocationView(),
      ),
    ],
  );
}
