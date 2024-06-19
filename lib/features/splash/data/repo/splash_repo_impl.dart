import 'package:dio/dio.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/splash/data/repo/splash_repo.dart';
import '../../../../core/constans/api_constance.dart';
import '../../../../core/helper/api.dart';

class SplashRepoImpl implements SplashRepo {
  @override
  Future<bool> checkUserLogin() async {
    try {
      String token = GetEmployeeData().token;
      Response response = await Api().post(
        endPoint: checkLogin,
        body: null,
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['messages']) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (ex) {
      return false;
      //......
    }
  }
}
