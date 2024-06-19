import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/errors/failure.dart';

abstract class LogoutRepo {
  Future<Either<Failure, String>> logout({required String token});
}
