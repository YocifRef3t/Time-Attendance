import 'package:hive_flutter/adapters.dart';
import 'package:time_attendance/core/constans/database_constans.dart';
import 'package:time_attendance/core/models/user_settings_model.dart';

class GetUserSettingsData {
  final _box = Hive.box<UserSettingsModel>(kUserSettingsBox);
  String? get language => _getLanguage();

  String? _getLanguage() {
    var data = _box.values.toList();
    if (data.isEmpty) return null;
    return data[0].language;
  }
}
