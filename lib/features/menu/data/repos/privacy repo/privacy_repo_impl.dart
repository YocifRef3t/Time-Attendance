import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';

import '../../../../../core/constans/api_constance.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_router.dart';
import 'privacy_repo.dart';

class PrivacyRepoImpl implements PrivacyRepo {
  @override
  Future<Either<Failure, String>> changePassword({
    required String token,
    required String currentPassword,
    required String password,
    required String conPassword,
  }) async {
    try {
      Response response = await Api().post(endPoint: kChangePassword, body: {
        "currentPassword": currentPassword,
        "password": password,
        "passwordConfirmation": conPassword,
        "lang": Intl.getCurrentLocale(),
      }, headers: {
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 200) {
          return right(data['messages']);
        } else {
          return left(Failure(errorMessage: data['messages']));
        }
      } else {
        return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later",
        ));
      }
    } on DioException catch (ex) {
      debugPrint(ex.message);
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }
}
