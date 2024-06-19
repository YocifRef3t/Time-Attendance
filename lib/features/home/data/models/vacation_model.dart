class VacationModel {
  final String vacationType;
  final String dateRequest;
  final String dateFrom;
  final String dateTo;
  final String dateReturn;
  final String daysCount;
  final String deductedFromEmployee;
  VacationModel({
    required this.vacationType,
    required this.dateRequest,
    required this.dateFrom,
    required this.dateTo,
    required this.dateReturn,
    required this.daysCount,
    required this.deductedFromEmployee,
  });
  factory VacationModel.fromJson(json) {
    return VacationModel(
      vacationType: json['vacationType'].toString(),
      dateRequest: json['dateRequest'].toString(),
      dateFrom: json['dateFrom'].toString(),
      dateTo: json['dateTo'].toString(),
      dateReturn: json['dateReturn'].toString(),
      daysCount: json['daysCount'].toString(),
      deductedFromEmployee: json['deductedFromEmployee'].toString(),
    );
  }
}
