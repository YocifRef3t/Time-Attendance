import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/features/reports/data/models/permissions%20history/permissions_history_model.dart';

abstract class PermissionsHistoryRepo {
  Future<Either<Failure, PermissionsHistoryModel>> fetchPermissionsHistory({
    required String token,
    required String date,
  });
}
