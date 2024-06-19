import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/attendance_history_model.dart';

abstract class AttendanceHistoryRepo {
  Future<Either<Failure, AttendanceHistory>> fetchAttendanceHistory({
    required String token,
    required String date,
  });
}
