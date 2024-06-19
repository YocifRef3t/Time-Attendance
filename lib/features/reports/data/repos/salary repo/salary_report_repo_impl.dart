import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/features/reports/data/models/salary%20report/salary_report_model.dart';
import 'package:time_attendance/features/reports/data/repos/salary%20repo/salary_report_repo.dart';

import '../../../../../core/constans/api_constance.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/utls/app_router.dart';

class SalaryRepoImpl implements SalaryRepo {
  @override
  Future<Either<Failure, List<SalaryReportModel>>> fetchSalaryReport(
      {required String token}) async {
    try {
      Response response = await Api().get(endPoint: getEmpSalaries, headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 400) {
          return left(Failure(errorMessage: data['message']));
        } else {
          List<SalaryReportModel> salaries = [];
          for (int i = 0; i < (data['data'] as List<dynamic>).length; i++) {
            salaries.add(SalaryReportModel.fromJson(data['data'][i]));
          }
          return right(salaries);
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
}
