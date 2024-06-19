class SalaryReportModel {
  final int month;
  final String year;
  final String netSalary;
  const SalaryReportModel({
    required this.month,
    required this.year,
    required this.netSalary,
  });

  factory SalaryReportModel.fromJson(json) {
    return SalaryReportModel(
      month: json['month'],
      year: json['year'].toString(),
      netSalary: json['netSalary'],
    );
  }
}
