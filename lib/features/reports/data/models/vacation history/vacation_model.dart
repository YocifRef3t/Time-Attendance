import 'package:time_attendance/features/reports/data/models/vacation%20history/vacation_data_model.dart';

class VacationHistoryData {
  final int vacationsTaken;
  final int availableVacations;
  final List<VacationData> vacations;

  VacationHistoryData({
    required this.vacationsTaken,
    required this.availableVacations,
    required this.vacations,
  });

  factory VacationHistoryData.fromJson(json) {
    return VacationHistoryData(
      vacationsTaken: json['data']['vacationsTaken'],
      availableVacations: json['data']['availableVacations'],
      vacations: (json['data']['vacations'] as List<dynamic>)
          .map((e) => VacationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
