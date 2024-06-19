import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/features/reports/data/models/permissions%20history/permissions_history_model.dart';
import 'package:time_attendance/features/reports/data/repos/permissions%20history%20repo/permissions_history_repo.dart';

import '../../../../../core/constans/api_constance.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_router.dart';

class PermissionsHistoryRepoImpl implements PermissionsHistoryRepo {
  @override
  Future<Either<Failure, PermissionsHistoryModel>> fetchPermissionsHistory({
    required String token,
    required String date,
  }) async {
    try {
      Response response = await Api()
          .get(endPoint: "$newPermissionHistoryData?date=$date", headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        var data = response.data;
        return right(PermissionsHistoryModel.fromJson(data));
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
