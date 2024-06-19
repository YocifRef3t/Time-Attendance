import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/features/home/data/models/home_model.dart';
import 'package:time_attendance/features/home/data/models/notification_model.dart';
import 'package:time_attendance/features/home/data/models/penalties_details_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> fetchHomeData({required String date});
  /*########################################################################*/
  Future<Either<Failure, String>> sendPermissionRequest({
    required String token,
    required String dateFrom,
    required String dateTo,
    required String timeFrom,
    required String timeTo,
    required String noteAr,
    required String noteEn,
    required String typeOfPermission,
  });
  /*########################################################################*/

  Future<Either<Failure, String>> sendLoanRequest({
    required String token,
    required String amount,
    required String type,
    required String description,
  });
  /*########################################################################*/

  Future<Either<Failure, String>> sendVacationRequest({
    required String token,
    required String dateFrom,
    required String dateTo,
    required String noteAr,
    required String vacationType,
  });
  /*########################################################################*/

  Future<Either<Failure, String>> sendAttendance({
    required String token,
    required String longitude,
    required String latitude,
    required String date,
    required String time,
    required String deviceIp,
  });

  /*########################################################################*/

  Future<Either<Failure, PenaltiesDetailsModel>> fetchPenaltyDetails({
    required String token,
  });

  /*########################################################################*/

  Future<Either<Failure, String>> sendPenalty({
    required String token,
    required String empId,
    required String decisionAt,
    required String penaltyType,
    required String penaltyRsn,
    required String penaltyAmount,
    required String warningMsg,
  });
  /*########################################################################*/

  Future<Either<Failure, String>> sendViolation({
    required String token,
    required String empId,
    required String idNo,
    required String punshRepeat,
    required String decisionAt,
    required String punshNo,
  });

  /*########################################################################*/

  Future<Either<Failure, String>> sendLateAttendance({
    required String token,
    required String date,
    required String time,
    required String eFunction,
    required String description,
    required String longitude,
    required String latitude,
  });
  /*########################################################################*/

  Future<Either<Failure, List<NotificationModel>>> fetchNotifications({
    required String token,
  });

  /*########################################################################*/

  Future<Either<Failure, int>> getNotificationCounter({
    required String token,
    required String empId,
  });
  /*########################################################################*/

  Future<void> readAllNotifications({
    required String token,
    required String empId,
  });
}
