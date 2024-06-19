import 'package:hive/hive.dart';

part 'profile_data.g.dart';

@HiveType(typeId: 2)
class ProfileDataModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyName;
  @HiveField(2)
  String branchName;
  @HiveField(3)
  String employeeName;
  @HiveField(4)
  String countryName;
  @HiveField(5)
  String jobStatus;
  @HiveField(6)
  String jobName;
  @HiveField(7)
  String iDNumber;
  @HiveField(8)
  String iDExpirationDate;
  @HiveField(9)
  String employeeAddress;
  @HiveField(10)
  String employeeEmail;
  @HiveField(11)
  String employeePhone;
  @HiveField(12)
  String totalSalary;
  @HiveField(13)
  String workHour;
  @HiveField(14)
  String employeeImage;

  ProfileDataModel({
    required this.id,
    required this.companyName,
    required this.branchName,
    required this.employeeName,
    required this.countryName,
    required this.jobStatus,
    required this.jobName,
    required this.iDNumber,
    required this.iDExpirationDate,
    required this.employeeAddress,
    required this.employeeEmail,
    required this.employeePhone,
    required this.totalSalary,
    required this.workHour,
    required this.employeeImage,
  });

  factory ProfileDataModel.fromJson(json) {
    return ProfileDataModel(
      id: json['data']['id'].toString(),
      companyName: json['data']['companyName'],
      branchName: json['data']['branchName'],
      employeeName: json['data']['employeeName'],
      countryName: json['data']['countryName'],
      jobStatus: json['data']['jobStatus'],
      jobName: json['data']['jobName'],
      iDNumber: json['data']['iDNumber'],
      iDExpirationDate: json['data']['iDExpirationDate'],
      employeeAddress: json['data']['employeeAddress'],
      employeeEmail: json['data']['employeeEmail'],
      employeePhone: json['data']['employeePhone'],
      totalSalary: json['data']['totalSalary'],
      workHour: json['data']['workHour'],
      employeeImage: json['data']['employeeImage'],
    );
  }
}
