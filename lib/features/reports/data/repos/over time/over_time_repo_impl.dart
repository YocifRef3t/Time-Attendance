import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/features/reports/data/models/over%20time/over_time_model.dart';
import 'package:time_attendance/features/reports/data/repos/over%20time/over_time_repo.dart';

import '../../../../../core/constans/api_constance.dart';
import '../../../../../core/helper/api.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_router.dart';

class OverTimeImpl implements OverTimeRepo {
  @override
  Future<Either<Failure, OverTimeModel>> fetchOverTime(
      {required String token, required String date}) async {
    try {
      Response response = await Api().get(
        endPoint: "$newOverTimeHistoryData?date=$date",
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        return right(OverTimeModel.fromJson(data));
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
}
