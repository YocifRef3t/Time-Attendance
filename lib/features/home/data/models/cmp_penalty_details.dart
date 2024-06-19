class CmpPenaltyDetails {
  int? iDNo;
  int? penaltiesNo;
  String? penaltiesDscAr;
  String? discPenalCheck1;
  String? discPenalRate1;
  String? discPenalDays1;
  String? discPenalClauses1;
  String? discPenalCheck2;
  String? discPenalRate2;
  String? discPenalDays2;
  String? discPenalClauses2;
  String? discPenalCheck3;
  String? discPenalRate3;
  String? discPenalDays3;
  String? discPenalClauses3;
  String? discPenalCheck4;
  String? discPenalRate4;
  String? discPenalDays4;
  String? discPenalClauses4;
  dynamic details1;
  dynamic details2;
  dynamic details3;
  dynamic details4;

  CmpPenaltyDetails(
      {this.iDNo,
      this.penaltiesNo,
      this.penaltiesDscAr,
      this.discPenalCheck1,
      this.discPenalRate1,
      this.discPenalDays1,
      this.discPenalClauses1,
      this.discPenalCheck2,
      this.discPenalRate2,
      this.discPenalDays2,
      this.discPenalClauses2,
      this.discPenalCheck3,
      this.discPenalRate3,
      this.discPenalDays3,
      this.discPenalClauses3,
      this.discPenalCheck4,
      this.discPenalRate4,
      this.discPenalDays4,
      this.discPenalClauses4,
      this.details1,
      this.details2,
      this.details3,
      this.details4});

  factory CmpPenaltyDetails.fromJson(json) {
    return CmpPenaltyDetails(
      iDNo: json['IDNo'] as int?,
      penaltiesNo: json['Penalties_No'] as int?,
      penaltiesDscAr: json['PenaltiesDscAr'] as String?,
      discPenalCheck1: json['discPenalCheck1'] as String?,
      discPenalRate1: json['discPenalRate1'] as String?,
      discPenalDays1: json['discPenalDays1'] as String?,
      discPenalClauses1: json['discPenalClauses1'] as String?,
      discPenalCheck2: json['discPenalCheck2'] as String?,
      discPenalRate2: json['discPenalRate2'] as String?,
      discPenalDays2: json['discPenalDays2'] as String?,
      discPenalClauses2: json['discPenalClauses2'] as String?,
      discPenalCheck3: json['discPenalCheck3'] as String?,
      discPenalRate3: json['discPenalRate3'] as String?,
      discPenalDays3: json['discPenalDays3'] as String?,
      discPenalClauses3: json['discPenalClauses3'] as String?,
      discPenalCheck4: json['discPenalCheck4'] as String?,
      discPenalRate4: json['discPenalRate4'] as String?,
      discPenalDays4: json['discPenalDays4'] as String?,
      discPenalClauses4: json['discPenalClauses4'] as String?,
      details1: json['details1'],
      details2: json['details2'],
      details3: json['details3'],
      details4: json['details4'],
    );
  }
}
