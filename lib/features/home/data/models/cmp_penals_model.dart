import 'package:time_attendance/features/home/data/models/cmp_penalty_details.dart';

class CmpPenals {
  int? penaltiesNo;
  String? penaltiesDscAr;
  List<CmpPenaltyDetails>? details;
  CmpPenals({
    required this.penaltiesNo,
    required this.penaltiesDscAr,
    required this.details,
  });

  factory CmpPenals.fromJson(json) {
    return CmpPenals(
      penaltiesNo: json['Penalties_No'] as int?,
      penaltiesDscAr: json['PenaltiesDscAr'] as String?,
      details: (json['penals_dtls'] as List<dynamic>?)
          ?.map((e) => CmpPenaltyDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
