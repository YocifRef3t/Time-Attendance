class PenaltiesReportModel {
  String? id;
  String? trNo;
  String? companyId;
  String? employeeId;
  String? typeOfPermission;
  String? reviewDesc;
  String? reviewTr;
  String? reviewDt;
  String? decisionDate;
  String? resolutionNo;
  String? repeatPunish;
  String? penaltiesHdrsDscAr;
  String? penaltiesDtlsDscAr;
  String? grossSalary;
  String? penalClauses;
  String? discountValue;
  String? extraValue;
  String? netSalary;
  String? reviewCase;
  String? usernameReview;
  String? usernameImplement;
  String? usernameApproving;
  String? usernameCreator;
  String? deductionKind;
  String? penaltyType;
  String? penaltyReason;
  String? penaltyAmount;
  String? warningMessage;

  PenaltiesReportModel({
    required this.id,
    required this.trNo,
    required this.companyId,
    required this.employeeId,
    required this.typeOfPermission,
    required this.reviewDesc,
    required this.reviewTr,
    required this.reviewDt,
    required this.decisionDate,
    required this.resolutionNo,
    required this.repeatPunish,
    required this.penaltiesHdrsDscAr,
    required this.penaltiesDtlsDscAr,
    required this.grossSalary,
    required this.penalClauses,
    required this.discountValue,
    required this.extraValue,
    required this.netSalary,
    required this.reviewCase,
    required this.usernameReview,
    required this.usernameImplement,
    required this.usernameApproving,
    required this.usernameCreator,
    required this.deductionKind,
    required this.penaltyType,
    required this.penaltyReason,
    required this.penaltyAmount,
    required this.warningMessage,
  });

  factory PenaltiesReportModel.fromJson(json) {
    return PenaltiesReportModel(
      id: json['id'].toString(),
      trNo: json['trNo'].toString(),
      companyId: json['companyId'].toString(),
      employeeId: json['employeeId'].toString(),
      typeOfPermission: json['typeOfPermission'].toString(),
      reviewDesc: json['reviewDesc'].toString(),
      reviewTr: json['reviewTr'].toString(),
      reviewDt: json['reviewDt'].toString(),
      decisionDate: json['decisionDate'].toString(),
      resolutionNo: json['resolutionNo'].toString(),
      repeatPunish: json['repeatPunish'].toString(),
      penaltiesHdrsDscAr: json['penaltiesHdrsDscAr'].toString(),
      penaltiesDtlsDscAr: json['penaltiesDtlsDscAr'].toString(),
      grossSalary: json['grossSalary'].toString(),
      penalClauses: json['penalClauses'].toString(),
      discountValue: json['discountValue'].toString(),
      extraValue: json['extraValue'].toString(),
      netSalary: json['netSalary'].toString(),
      reviewCase: json['reviewCase'].toString(),
      usernameReview: json['usernameReview'].toString(),
      usernameImplement: json['usernameImplement'].toString(),
      usernameApproving: json['usernameApproving'].toString(),
      usernameCreator: json['usernameCreator'].toString(),
      deductionKind: json['deductionKind'].toString(),
      penaltyType: json['penaltyType'].toString(),
      penaltyReason: json['penaltyReason'].toString(),
      penaltyAmount: json['penaltyAmount'].toString(),
      warningMessage: json['warningMessage'].toString(),
    );
  }
}
