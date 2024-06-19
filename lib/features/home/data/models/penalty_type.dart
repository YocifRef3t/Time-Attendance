class PenaltyType {
  final String? t1;
  final String? t2;
  final String? t3;
  final String? t4;
  final String? t5;
  PenaltyType({
    required this.t1,
    required this.t2,
    required this.t3,
    required this.t4,
    required this.t5,
  });

  factory PenaltyType.fromJson(json) {
    return PenaltyType(
      t1: json['1'].toString(),
      t2: json['2'].toString(),
      t3: json['3'].toString(),
      t4: json['4'].toString(),
      t5: json['5'].toString(),
    );
  }
}
