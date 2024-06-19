import 'package:time_attendance/features/home/data/models/vacation_model.dart';

class HomeModel {
  final String attendADays;
  final String attendBDays;
  final String attendCDays;
  final String attendDDays;
  final String attendAndDeparture;
  final String absenceDays;
  final String delayDays;
  final String delayHours;
  final String earlyDepartureDays;
  final String extraDays;
  final String workHoursSum;
  final String overtimeHoursSum;
  final String hourCost;
  final String extraHourCost;
  final String salaryOnExtra;
  final String vacationsTaken;
  final String availableVacations;
  final List<VacationModel>? vacations;

  HomeModel({
    required this.attendADays,
    required this.attendBDays,
    required this.attendCDays,
    required this.attendDDays,
    required this.attendAndDeparture,
    required this.absenceDays,
    required this.delayDays,
    required this.delayHours,
    required this.earlyDepartureDays,
    required this.extraDays,
    required this.workHoursSum,
    required this.overtimeHoursSum,
    required this.hourCost,
    required this.extraHourCost,
    required this.salaryOnExtra,
    required this.vacationsTaken,
    required this.availableVacations,
    required this.vacations,
  });

  factory HomeModel.fromJson(json) {
    return HomeModel(
      extraHourCost: json['data']['extraHourCost'].toString(),
      workHoursSum: json['data']['workHoursSum'].toString(),
      attendADays: json['data']['attendADays'].toString(),
      attendBDays: json['data']['attendBDays'].toString(),
      attendCDays: json['data']['attendCDays'].toString(),
      attendDDays: json['data']['attendDDays'].toString(),
      absenceDays: json['data']['absenceDays'].toString(),
      delayDays: json['data']['delayDays'].toString(),
      extraDays: json['data']['extraDays'].toString(),
      hourCost: json['data']['hourCost'].toString(),
      delayHours: json['data']['delayHours'].toString(),
      salaryOnExtra: json['data']['salaryOnExtra'].toString(),
      vacationsTaken: json['data']['vacationsTaken'].toString(),
      overtimeHoursSum: json['data']['overtimeHoursSum'].toString(),
      attendAndDeparture: json['data']['attendAndDeparture'].toString(),
      earlyDepartureDays: json['data']['earlyDepartureDays'].toString(),
      availableVacations: json['data']['availableVacations'].toString(),
      vacations: (json['data']['vacations'] as List<dynamic>)
          .map((e) => VacationModel.fromJson(
                e as Map<String, dynamic>,
              ))
          .toList(),
    );
  }
}
