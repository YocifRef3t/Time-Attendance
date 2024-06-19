import 'package:dartz/dartz.dart';
import 'package:time_attendance/features/reports/data/models/over%20time/over_time_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class OverTimeRepo {
  Future<Either<Failure, OverTimeModel>> fetchOverTime({
    required String token,
    required String date,
  });
  /*####################################################################*/
}
