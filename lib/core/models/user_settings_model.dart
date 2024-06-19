import 'package:hive/hive.dart';

part 'user_settings_model.g.dart';

@HiveType(typeId: 3)
class UserSettingsModel extends HiveObject {
  @HiveField(0)
  String language;
  UserSettingsModel({required this.language});
}
