import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:time_attendance/core/models/user_settings_model.dart';
import '../../../../../core/constans/database_constans.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  final _box = Hive.box<UserSettingsModel>(kUserSettingsBox);

  void changeLanguage({required String languageCode}) {
    var data = _box.values.toList();
    if (data.isEmpty) {
      _box.add(UserSettingsModel(language: languageCode));
    } else {
      data[0].language = languageCode;
      data[0].save();
    }
    emit(LanguageChanged(languageCode: languageCode));
  }
}
