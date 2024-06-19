import 'package:time_attendance/features/reports/data/models/loans%20request/financial_data_model.dart';

class FinancialDetailsData {
  final int advancePaymentCount;
  final int advancePaymentAmount;
  final int custodyCount;
  final int custodyAmount;
  final List<FinancialData> financialData;

  FinancialDetailsData({
    required this.advancePaymentCount,
    required this.advancePaymentAmount,
    required this.custodyCount,
    required this.custodyAmount,
    required this.financialData,
  });

  factory FinancialDetailsData.fromJson(json) {
    return FinancialDetailsData(
      advancePaymentCount: json['data']['advancePaymentCount'],
      advancePaymentAmount: json['data']['advancePaymentAmount'],
      custodyCount: json['data']['custodyCount'],
      custodyAmount: json['data']['custodyAmount'],
      financialData: (json['data']['financialData'] as List<dynamic>)
          .map((e) => FinancialData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
