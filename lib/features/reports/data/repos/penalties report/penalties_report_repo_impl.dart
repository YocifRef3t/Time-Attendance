import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/constans/api_constance.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/features/reports/data/models/penalties%20report/penalties_report_model.dart';
import 'package:time_attendance/features/reports/data/repos/penalties%20report/penalties_report_repo.dart';

import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_router.dart';

class PenaltiesReportRepoImpl implements PenaltiesReportRepo {
  @override
  Future<Either<Failure, List<PenaltiesReportModel>>> fetchPenaltiesReport(
      {required String token}) async {
    try {
      Response response = await Api().get(endPoint: penaltiesHistory, headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 400) {
          return left(Failure(errorMessage: data['messages']));
        } else {
          List<PenaltiesReportModel> penalties = [];
          for (int i = 0; i < (data['data'] as List<dynamic>).length; i++) {
            penalties.add(PenaltiesReportModel.fromJson(data['data'][i]));
          }
          return right(penalties);
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
  Future<Either<Failure, String>> sendGrievance({
    required String token,
    required String id,
    required String decoration,
  }) async {
    try {
      Response response = await Api().post(endPoint: penaltiesUpdate, body: {
        "lang": Intl.getCurrentLocale(),
        "id": id,
        "reviewDesc": decoration,
      }, headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 400) {
          return left(Failure(errorMessage: data['messages']));
        } else {
          return right(data['messages']);
        }
      } else {
        return left(Failure(
          errorMessage: "Oops there was an error ,please try again later",
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
