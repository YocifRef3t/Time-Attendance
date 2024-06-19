import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/features/reports/data/repos/vacation%20history/vacation_repo.dart';

import '../../../../../core/constans/api_constance.dart';
import '../../../../../core/utls/app_router.dart';
import '../../models/vacation history/vacation_model.dart';

class VacationRepoImpl implements VacationRepo {
  @override
  Future<Either<Failure, VacationHistoryData>> fetchVacationsHistory(
      {required String token, required String date}) async {
    try {
      Response response = await Api()
          .get(endPoint: "$newVacationsHistoryData?date=$date", headers: {
        'Authorization': "Bearer $token",
      });

      if (response.statusCode == 200) {
        var data = response.data;
        return right(VacationHistoryData.fromJson(data));
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
