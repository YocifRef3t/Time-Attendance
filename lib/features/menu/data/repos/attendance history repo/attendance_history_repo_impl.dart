import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';

import 'package:time_attendance/features/menu/data/models/attendance_history_model.dart';

import '../../../../../core/constans/api_constance.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_router.dart';
import 'attendance_history_repo.dart';

class AttendanceHistoryRepoImpl implements AttendanceHistoryRepo {
  @override
  Future<Either<Failure, AttendanceHistory>> fetchAttendanceHistory(
      {required String token, required String date}) async {
    try {
      Response response = await Api()
          .get(endPoint: "$newAttendanceHistoryData?date=$date", headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 400) {
          return left(Failure(errorMessage: data['messages']));
        } else {
          return right(AttendanceHistory.fromJson(data));
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
