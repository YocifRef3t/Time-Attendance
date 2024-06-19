import 'package:hive/hive.dart';
part 'employee_model.g.dart';

@HiveType(typeId: 1)
class EmployeeModel extends HiveObject {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final String nameAr;
  @HiveField(2)
  final String nameEn;
  @HiveField(3)
  final String companyNameAr;
  @HiveField(4)
  final String companyNameEn;
  @HiveField(5)
  final String userName;
  @HiveField(6)
  final String phone;
  @HiveField(7)
  final String email;
  @HiveField(8)
  final String address;
  @HiveField(9)
  final String employeeType;
  @HiveField(10)
  final String jobNameAr;
  @HiveField(11)
  final String jobNameEn;
  @HiveField(12)
  final String countryNameAr;
  @HiveField(13)
  final String countryNameEn;
  @HiveField(14)
  final int companyId;
  @HiveField(15)
  final int id;
  @HiveField(16)
  final int empType;

  EmployeeModel({
    required this.token,
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.companyNameAr,
    required this.companyNameEn,
    required this.companyId,
    required this.userName,
    required this.phone,
    required this.email,
    required this.address,
    required this.employeeType,
    required this.jobNameAr,
    required this.jobNameEn,
    required this.countryNameAr,
    required this.countryNameEn,
    required this.empType,
  });

  factory EmployeeModel.fromJson(json) {
    return EmployeeModel(
      token: json['access_token'],
      id: json['data']['id'] ?? "",
      nameAr: json['data']['nameAr'] ?? "",
      nameEn: json['data']['nameEn'] ?? "",
      companyNameAr: json['data']['companyNameAr'] ?? "",
      companyNameEn: json['data']['companyNameEn'] ?? "",
      companyId: json['data']['companyId'] ?? "",
      userName: json['data']['username'] ?? "",
      phone: json['data']['phone'] ?? "",
      email: json['data']['email'] ?? "",
      address: json['data']['address'] ?? "",
      employeeType: json['data']['employeeType'] ?? "",
      jobNameAr: json['data']['jobNameAr'] ?? "",
      jobNameEn: json['data']['jobNameEn'] ?? "",
      countryNameAr: json['data']['countryNameAr'] ?? "",
      countryNameEn: json['data']['countryNameEn'] ?? "",
      empType: json['data']['empType'] ?? 0,
    );
  }
}
