class PermissionModel {
  final String dateFrom;
  final String dateTo;
  final String timeFrom;
  final String timeTo;
  final String typeOfPermission;
  final String typeOfPermissionNo;
  final String requestStage;
  final int exePostTr;

  PermissionModel({
    required this.dateFrom,
    required this.dateTo,
    required this.timeFrom,
    required this.timeTo,
    required this.typeOfPermission,
    required this.typeOfPermissionNo,
    required this.requestStage,
    required this.exePostTr,
  });

  factory PermissionModel.fromJson(json) {
    return PermissionModel(
      dateFrom: json['dateFrom'],
      dateTo: json['dateTo'],
      timeFrom: json['timeFrom'],
      timeTo: json['timeTo'],
      typeOfPermission: json['typeOfPermission'],
      typeOfPermissionNo: json['typeOfPermissionNo'],
      requestStage: json['requestStage'],
      exePostTr: json['ExePost_Tr'],
    );
  }
}
