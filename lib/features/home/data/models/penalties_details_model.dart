import 'package:time_attendance/features/home/data/models/penalty_type.dart';
import 'cmp_penals_model.dart';
import 'employees_model.dart';

class PenaltiesDetailsModel {
  final List<EmployeesModel>? employees;
  final List<CmpPenals>? cmpPenals;
  final PenaltyType? penaltyType;

  PenaltiesDetailsModel({
    required this.employees,
    required this.cmpPenals,
    required this.penaltyType,
  });

  factory PenaltiesDetailsModel.fromJson(json) {
    return PenaltiesDetailsModel(
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => EmployeesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cmpPenals: (json['cmpPenals'] as List<dynamic>?)
          ?.map((e) => CmpPenals.fromJson(e as Map<String, dynamic>))
          .toList(),
      penaltyType: json['penaltyType'] == null
          ? null
          : PenaltyType.fromJson(json['penaltyType'] as Map<String, dynamic>),
    );
  }
}
