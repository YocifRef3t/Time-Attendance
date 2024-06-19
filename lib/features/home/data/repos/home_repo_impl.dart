import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/home/data/models/home_model.dart';
import 'package:time_attendance/features/home/data/models/notification_model.dart';
import 'package:time_attendance/features/home/data/models/penalties_details_model.dart';
import 'package:time_attendance/features/home/data/repos/home_repo.dart';
import '../../../../core/constans/api_constance.dart';
import '../../../../core/helper/translator.dart';
import '../../../../core/utls/app_router.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, HomeModel>> fetchHomeData(
      {required String date}) async {
    try {
      Response response = await Api().get(
        endPoint: "/employees/home?date=$date",
        headers: {
          'Authorization': "Bearer ${GetEmployeeData().token}",
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        return right(HomeModel.fromJson(data));
      } else {
        return left(
          Failure(
              errorMessage: AppRouter.navKey.currentContext != null
                  ? translator(AppRouter.navKey.currentContext!).oopsMessage
                  : "Oops there was an error ,please try again later"),
        );
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
  Future<Either<Failure, String>> sendPermissionRequest(
      {required String token,
      required String dateFrom,
      required String dateTo,
      required String timeFrom,
      required String timeTo,
      required String noteAr,
      required String noteEn,
      required String typeOfPermission}) async {
    try {
      Response response = await Api().post(endPoint: setExitPermission, body: {
        "lang": Intl.getCurrentLocale(),
        "dateFrom": dateFrom,
        "dateTo": dateTo,
        "timeFrom": timeFrom,
        "timeTo": timeTo,
        "noteAr": noteAr,
        "noteEn": noteEn,
        "typeOfPermission": typeOfPermission.toString(),
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
            errorMessage: AppRouter.navKey.currentContext != null
                ? translator(AppRouter.navKey.currentContext!).oopsMessage
                : AppRouter.navKey.currentContext != null
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
  Future<Either<Failure, String>> sendLoanRequest(
      {required String token,
      required String amount,
      required String type,
      required String description}) async {
    try {
      Response response = await Api().post(endPoint: loan, body: {
        'lang': Intl.getCurrentLocale(),
        'amount': amount,
        'type': type,
        'description': description,
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
  Future<Either<Failure, String>> sendVacationRequest(
      {required String token,
      required String dateFrom,
      required String dateTo,
      required String noteAr,
      required String vacationType}) async {
    try {
      Response response = await Api().post(endPoint: vacationData, body: {
        "lang": Intl.getCurrentLocale(),
        "dateFrom": dateFrom,
        "dateTo": dateTo,
        "vacationType": vacationType,
        "noteAr": noteAr,
      }, headers: {
        'Authorization': 'Bearer $token',
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
            errorMessage: "Oops there was an error ,please try again later"));
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
  Future<Either<Failure, String>> sendAttendance(
      {required String token,
      required String longitude,
      required String latitude,
      required String date,
      required String time,
      required String deviceIp}) async {
    try {
      Response response = await Api().post(endPoint: setAttendance, body: {
        "lang": Intl.getCurrentLocale(),
        "longitude": longitude,
        "latitude": latitude,
        "date": date,
        "time": time,
        "deviceIp": deviceIp,
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
  Future<Either<Failure, PenaltiesDetailsModel>> fetchPenaltyDetails(
      {required String token}) async {
    try {
      Response response =
          await Api().get(endPoint: getPunishmentDetails, headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 400) {
          return left(Failure(errorMessage: data['messages']));
        } else {
          return right(PenaltiesDetailsModel.fromJson(data));
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
  Future<Either<Failure, String>> sendPenalty({
    required String token,
    required String empId,
    required decisionAt,
    required String penaltyType,
    required String penaltyRsn,
    required String penaltyAmount,
    required String warningMsg,
  }) async {
    try {
      Response response = await Api().post(endPoint: setPunishment, body: {
        'lang': Intl.getCurrentLocale(),
        'empId': empId,
        'Dection_ActDt': decisionAt,
        'Dection_Kind': "2",
        'Penalty_Type': penaltyType,
        'Penalty_Rsn': penaltyRsn,
        'Penalty_Amount': penaltyAmount,
        'Wrning_Msg': warningMsg,
      }, headers: {
        'Authorization': "Bearer $token",
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
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }

  @override
  Future<Either<Failure, String>> sendViolation(
      {required String token,
      required String empId,
      required String idNo,
      required String punshRepeat,
      required String decisionAt,
      required String punshNo}) async {
    try {
      Response response = await Api().post(endPoint: setPunishment, body: {
        'lang': Intl.getCurrentLocale(),
        'empId': empId,
        'Punsh_Sub_No': idNo,
        'Dection_Kind': "1",
        "Dection_ActDt": decisionAt,
        'Punsh_Repeat': punshRepeat,
        'Punsh_No': punshNo,
      }, headers: {
        'Authorization': "Bearer $token",
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
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }

  @override
  Future<Either<Failure, String>> sendLateAttendance({
    required String token,
    required String date,
    required String time,
    required String eFunction,
    required String description,
    required String longitude,
    required String latitude,
  }) async {
    try {
      Response response = await Api().post(endPoint: setLateAttendance, body: {
        'lang': Intl.getCurrentLocale(),
        'dateFrom': date,
        'timeFrom': time,
        'noteAr': description,
        'longitude': longitude,
        'EFunction': eFunction,
        'latitude': latitude,
      }, headers: {
        'Authorization': "Bearer $token",
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
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> fetchNotifications(
      {required String token}) async {
    try {
      Response response = await Api().post(endPoint: notifications, body: {
        'emp_id': GetEmployeeData().id,
      }, headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['success']) {
          return right((data['notifications'] as List<dynamic>).map((e) {
            return NotificationModel.fromJson(e);
          }).toList());
        } else {
          return left(Failure(errorMessage: ""));
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
  Future<Either<Failure, int>> getNotificationCounter({
    required String token,
    required String empId,
  }) async {
    try {
      int counter = 0;
      Response response = await Api().post(endPoint: notifications, body: {
        'emp_id': empId,
        'type': 0,
      }, headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['success']) {
          for (var notification in data['notifications']) {
            if (notification['read_at'] == null) {
              counter++;
            }
          }
          return right(counter);
        } else {
          return left(Failure(errorMessage: ""));
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
  Future<void> readAllNotifications({
    required String token,
    required String empId,
  }) async {
    try {
      await Api().post(endPoint: notifications, body: {
        'emp_id': empId,
        'type': '1',
      }, headers: {
        'Authorization': "Bearer $token",
      });
    } on DioException {
      //...
    } catch (ex) {
      //....
    }
  }
}
