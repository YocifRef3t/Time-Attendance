import 'package:dartz/dartz.dart';
import 'package:time_attendance/core/models/employee_model.dart';
import 'package:time_attendance/core/models/profile_data.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, EmployeeModel>> login({
    required String email,
    required String password,
    required String language,
  });
  //////////////////////////////////////////////////////////////////

  Future<Either<Failure, ProfileDataModel>> fetchProfileDate({
    required String token,
  });
  //////////////////////////////////////////////////////////////////

  Future<Either<Failure, String>> resetPassword({
    required String email,
  });
}
