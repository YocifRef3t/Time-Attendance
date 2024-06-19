class AttendanceHistoryData {
  final String? date;
  final String? timeA;
  final String? timeB;
  final String? timeC;
  final String? timeD;

  AttendanceHistoryData({
    required this.date,
    required this.timeA,
    required this.timeB,
    required this.timeC,
    required this.timeD,
  });

  factory AttendanceHistoryData.fromJson(json) {
    return AttendanceHistoryData(
      date: json['date'],
      timeA: json['time(A)'],
      timeB: json['time(B)'],
      timeC: json['time(C)'],
      timeD: json['time(D)'],
    );
  }
}
