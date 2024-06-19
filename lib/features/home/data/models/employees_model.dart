class EmployeesModel {
  final String empId;
  final String name;
  final String grossSalary;
  EmployeesModel({
    required this.empId,
    required this.name,
    required this.grossSalary,
  });

  factory EmployeesModel.fromJson(json) {
    return EmployeesModel(
      empId: json['empId'].toString(),
      name: json['name'].toString(),
      grossSalary: json['GrossSalary'].toString(),
    );
  }
}
