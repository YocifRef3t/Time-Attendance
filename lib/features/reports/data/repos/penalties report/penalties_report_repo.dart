import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/features/reports/data/models/penalties%20report/penalties_report_model.dart';

abstract class PenaltiesReportRepo {
  Future<Either<Failure, List<PenaltiesReportModel>>> fetchPenaltiesReport({
    required String token,
  });
  /*###########################################################################*/

  Future<Either<Failure, String>> sendGrievance({
    required String token,
    required String id,
    required String decoration,
  });
}
