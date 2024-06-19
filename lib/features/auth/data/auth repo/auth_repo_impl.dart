import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/constans/api_constance.dart';
import 'package:time_attendance/core/constans/database_constans.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/models/employee_model.dart';
import 'package:time_attendance/core/models/profile_data.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import 'package:time_attendance/features/auth/data/auth%20repo/auth_repo.dart';
import 'package:flutter_udid/flutter_udid.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, EmployeeModel>> login({
    required String email,
    required String password,
    required String language,
  }) async {
    try {
      String deviceIp = await FlutterUdid.consistentUdid;
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? fCMToken = await messaging.getToken();
      print("/###################### TOKEN ########################/");
      print("token : $fCMToken");
      var response = await Api().post(
        endPoint: authLogin,
        body: {
          'username': email,
          'password': password,
          'lang': language,
          'deviceIp': deviceIp,
          'deviceToken': fCMToken,
        },
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] != 200) {
          var box = Hive.box<EmployeeModel>(kEmployeeBox);
          await box.add(EmployeeModel.fromJson(data));
          return right(EmployeeModel.fromJson(data));
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
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }

  @override
  Future<Either<Failure, ProfileDataModel>> fetchProfileDate(
      {required String token}) async {
    try {
      var response = await Api().get(
        endPoint: newProfileData,
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 422) {
          return left(Failure(errorMessage: data['messages']));
        } else {
          var box = Hive.box<ProfileDataModel>(kProfileDateBox);
          await box.add(ProfileDataModel.fromJson(data));
          return right(ProfileDataModel.fromJson(data));
        }
      } else {
        return left(Failure(
            errorMessage: AppRouter.navKey.currentContext != null
                ? translator(AppRouter.navKey.currentContext!).oopsMessage
                : "Oops there was an error ,please try again later"));
      }
    } on DioException catch (ex) {
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({required String email}) async {
    try {
      Response response = await Api().post(
        endPoint: resetPasswordUrl,
        customURL: "",
        body: {
          'lang': Intl.getCurrentLocale(),
          'email': email,
        },
      );
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
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }
}
