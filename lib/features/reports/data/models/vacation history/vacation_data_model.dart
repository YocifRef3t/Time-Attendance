class VacationData {
  final String vacationType;
  final String dateRequest;
  final String dateFrom;
  final String dateTo;
  final String dateReturn;
  final int daysCount;
  final int deductedFromEmployee;
  final String requestStage;
  final int exePostTr;

  VacationData({
    required this.vacationType,
    required this.dateRequest,
    required this.dateFrom,
    required this.dateTo,
    required this.dateReturn,
    required this.daysCount,
    required this.deductedFromEmployee,
    required this.requestStage,
    required this.exePostTr,
  });

  factory VacationData.fromJson(json) {
    return VacationData(
      vacationType: json['vacationType'],
      dateRequest: json['dateRequest'],
      dateFrom: json['dateFrom'],
      dateTo: json['dateTo'],
      dateReturn: json['dateReturn'],
      daysCount: json['daysCount'],
      deductedFromEmployee: json['deductedFromEmployee'],
      requestStage: json['requestStage'],
      exePostTr: json['ExePost_Tr'],
    );
  }
}
