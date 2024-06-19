import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/errors/failure.dart';
import '../../models/vacation history/vacation_model.dart';

abstract class VacationRepo {
  Future<Either<Failure, VacationHistoryData>> fetchVacationsHistory({
    required String token,
    required String date,
  });
}
