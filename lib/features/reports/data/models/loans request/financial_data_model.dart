class FinancialData {
  final String date;
  final String? generalFund;
  final String? payForIt;
  final String typeName;
  final String? description;
  final String requestStage;
  final int type;
  final int amount;
  final int? accountNumber;
  final int? implementUserTr;

  FinancialData({
    required this.date,
    required this.generalFund,
    required this.payForIt,
    required this.typeName,
    required this.description,
    required this.requestStage,
    required this.accountNumber,
    required this.amount,
    required this.type,
    required this.implementUserTr,
  });

  factory FinancialData.fromJson(json) {
    return FinancialData(
      date: json['date'],
      generalFund: json['generalFund'],
      payForIt: json['payForIt'],
      typeName: json['typeName'],
      description: json['description'],
      requestStage: json['requestStage'],
      accountNumber: json['accountNumber'],
      amount: json['amount'],
      type: json['type'],
      implementUserTr: json['Implement_User_Tr'],
    );
  }
}
