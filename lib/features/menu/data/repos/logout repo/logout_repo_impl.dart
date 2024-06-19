import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/constans/api_constance.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/features/menu/data/repos/logout%20repo/logout_repo.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_router.dart';

class LogoutRepoImpl implements LogoutRepo {
  @override
  Future<Either<Failure, String>> logout({required String token}) async {
    try {
      Response response = await Api().get(
        endPoint: "$authLogout?lang=${Intl.getCurrentLocale()}",
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        return right(data["messages"]);
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
