import 'package:hive_flutter/adapters.dart';
import 'package:time_attendance/core/constans/database_constans.dart';
import 'package:time_attendance/core/models/profile_data.dart';

class GetProfileData {
  final _box = Hive.box<ProfileDataModel>(kProfileDateBox);
  String get id => _getId();
  String get companyName => _getCompanyName();
  String get branchName => _getBranchName();
  String get employeeName => _getEmployeeName();
  String get countryName => _getCountryName();
  String get jobStatus => _getJobStatus();
  String get jobName => _getJobName();
  String get iDNumber => _getIdNumber();
  String get iDExpirationDate => _getIDExpirationDate();
  String get employeeAddress => _getEmployeeAddress();
  String get employeeEmail => _getEmployeeEmail();
  String get employeePhone => _getEmployeePhone();
  String get totalSalary => _getTotalSalary();
  String get workHour => _getWorkHour();
  String get employeeImage => _getEmployeeImage();

  String _getId() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";
    return data[0].id;
  }

  String _getCompanyName() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";
    return data[0].companyName;
  }

  String _getBranchName() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].branchName;
  }

  String _getEmployeeName() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].employeeName;
  }

  String _getCountryName() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].countryName;
  }

  String _getJobStatus() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].jobStatus;
  }

  String _getJobName() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].jobName;
  }

  String _getIdNumber() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].iDNumber;
  }

  String _getIDExpirationDate() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].iDExpirationDate;
  }

  String _getEmployeeAddress() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].employeeAddress;
  }

  String _getEmployeeEmail() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].employeeEmail;
  }

  String _getEmployeePhone() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].employeePhone;
  }

  String _getTotalSalary() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].totalSalary;
  }

  String _getWorkHour() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";

    return data[0].workHour;
  }

  String _getEmployeeImage() {
    var data = _box.values.toList();
    if (data.isEmpty) return "";
    return data[0].employeeImage;
  }
}
