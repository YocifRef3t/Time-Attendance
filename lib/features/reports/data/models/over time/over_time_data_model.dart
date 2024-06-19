class OverTimeDataModel {
  String? basicSalary;
  String? date;
  String? overtimeHour;
  String? overtimeRate;
  String? totalOvertimeHour;
  String? costHour;
  String? overtimeNetSalary;
  String? notesAr;
  String? requestStage;
  int? exePostTr;

  OverTimeDataModel({
    required this.basicSalary,
    required this.date,
    required this.overtimeHour,
    required this.overtimeRate,
    required this.totalOvertimeHour,
    required this.costHour,
    required this.overtimeNetSalary,
    required this.notesAr,
    required this.requestStage,
    required this.exePostTr,
  });

  factory OverTimeDataModel.fromJson(json) {
    return OverTimeDataModel(
      basicSalary: json['basicSalary'].toString(),
      date: json['date'].toString(),
      overtimeHour: json['overtimeHour'].toString(),
      overtimeRate: json['overtimeRate'].toString(),
      totalOvertimeHour: json['totalOvertimeHour'].toString(),
      costHour: json['costHour'].toString(),
      overtimeNetSalary: json['overtimeNetSalary'].toString(),
      notesAr: json['notesAr'],
      requestStage: json['requestStage'].toString(),
      exePostTr: json['exePostTr'],
    );
  }
}
