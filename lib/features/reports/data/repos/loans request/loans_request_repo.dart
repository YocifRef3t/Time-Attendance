import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/features/reports/data/models/loans%20request/financial_details_data_model.dart';

abstract class LoansRequestRepo {
  Future<Either<Failure, FinancialDetailsData>> fetchFinancialDetailsData({
    required String token,
    required String date,
  });
}
