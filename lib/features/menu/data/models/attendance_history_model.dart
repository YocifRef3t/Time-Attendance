import 'package:time_attendance/features/menu/data/models/attendance_history_data_model.dart';

class AttendanceHistory {
  final String? attendADays;
  final String? attendBDays;
  final String? attendCDays;
  final String? attendDDays;
  final String? attendAndDeparture;
  final String? absenceDays;
  final String? delayDays;
  final String? earlyDepartureDays;
  final String? extraDays;
  final String? workHoursSum;
  final String? overtimeHoursSum;
  final String? hourCost;
  final String? extraHourCost;
  final String? salaryOnExtra;
  final String? attendanceCount;
  final List<AttendanceHistoryData> attendanceList;

  AttendanceHistory({
    required this.attendADays,
    required this.attendBDays,
    required this.attendCDays,
    required this.attendDDays,
    required this.attendAndDeparture,
    required this.absenceDays,
    required this.delayDays,
    required this.earlyDepartureDays,
    required this.extraDays,
    required this.workHoursSum,
    required this.overtimeHoursSum,
    required this.hourCost,
    required this.extraHourCost,
    required this.salaryOnExtra,
    required this.attendanceCount,
    required this.attendanceList,
  });
  factory AttendanceHistory.fromJson(json) {
    return AttendanceHistory(
      attendADays: json['data']['attendADays'].toString(),
      attendBDays: json['data']['attendBDays'].toString(),
      attendCDays: json['data']['attendCDays'].toString(),
      attendDDays: json['data']['attendDDays'].toString(),
      attendAndDeparture: json['data']['attendAndDeparture'].toString(),
      absenceDays: json['data']['absenceDays'].toString(),
      delayDays: json['data']['delayDays'].toString(),
      earlyDepartureDays: json['data']['earlyDepartureDays'].toString(),
      extraDays: json['data']['extraDays'].toString(),
      workHoursSum: json['data']['workHoursSum'].toString(),
      overtimeHoursSum: json['data']['overtimeHoursSum'].toString(),
      hourCost: json['data']['hourCost'].toString(),
      extraHourCost: json['data']['extraHourCost'].toString(),
      salaryOnExtra: json['data']['salaryOnExtra'].toString(),
      attendanceCount: json['data']['attendanceCount'].toString(),
      attendanceList: (json['data']['attendance'] as List<dynamic>).map((e) {
        return AttendanceHistoryData.fromJson(e);
      }).toList(),
    );
  }
}
