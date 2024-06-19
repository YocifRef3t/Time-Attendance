import 'package:dartz/dartz.dart';
import 'package:time_attendance/features/reports/data/models/salary%20report/salary_report_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class SalaryRepo {
  Future<Either<Failure, List<SalaryReportModel>>> fetchSalaryReport({
    required String token,
  });
}
