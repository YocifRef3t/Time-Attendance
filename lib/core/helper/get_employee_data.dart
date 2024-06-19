import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:time_attendance/core/constans/database_constans.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/models/employee_model.dart';

class GetEmployeeData {
  final _box = Hive.box<EmployeeModel>(kEmployeeBox);
  int get id => _getId();
  int get empType => _getEmpType();
  int get companyId => _getCompanyId();
  String get token => _getToken();
  String get phone => _getPhone();
  String get email => _getEmail();
  String get name => _getName();
  String get address => _getAddress();
  String get userName => _getUserName();
  String get jobName => _getJobName();
  String get employeeType => _getEmployeeType();
  String get companyName => _getCompanyName();
  String get countryName => _getCountryName();
  EmployeeModel get model => _getModel();

  bool _isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  EmployeeModel _getModel() {
    var data = _box.values.toList();
    return data[0];
  }

  String _getName() {
    var data = _box.values.toList();
    if (_isArabic()) return data[0].nameAr;
    return data[0].nameEn;
  }

  int _getEmpType() {
    var data = _box.values.toList();
    return data[0].empType;
  }

  String _getToken() {
    var data = _box.values.toList();
    debugPrint(data[0].token);
    return data[0].token;
  }

  String _getCompanyName() {
    var data = _box.values.toList();
    if (_isArabic()) return data[0].companyNameAr;
    return data[0].companyNameEn;
  }

  String _getUserName() {
    var data = _box.values.toList();

    return data[0].userName;
  }

  String _getPhone() {
    var data = _box.values.toList();

    return data[0].phone;
  }

  String _getEmail() {
    var data = _box.values.toList();

    return data[0].email;
  }

  String _getAddress() {
    var data = _box.values.toList();

    return data[0].address;
  }

  String _getEmployeeType() {
    var data = _box.values.toList();

    return data[0].employeeType;
  }

  String _getJobName() {
    var data = _box.values.toList();
    if (_isArabic()) return data[0].jobNameAr;

    return data[0].jobNameEn;
  }

  String _getCountryName() {
    var data = _box.values.toList();

    if (_isArabic()) return data[0].countryNameAr;
    return data[0].countryNameEn;
  }

  int _getCompanyId() {
    var data = _box.values.toList();
    return data[0].companyId;
  }

  int _getId() {
    var data = _box.values.toList();
    return data[0].id;
  }

  Future<void> deleteBox() async {
    await _box.deleteFromDisk();
  }
}
