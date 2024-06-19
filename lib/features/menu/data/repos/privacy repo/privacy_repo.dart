import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/errors/failure.dart';

abstract class PrivacyRepo {
  Future<Either<Failure, String>> changePassword({
    required String token,
    required String currentPassword,
    required String password,
    required String conPassword,
  });
}
