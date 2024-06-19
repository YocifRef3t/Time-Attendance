import 'package:time_attendance/features/reports/data/models/over%20time/over_time_data_model.dart';

class OverTimeModel {
  String? totalOverTimeSalary;
  String? totalOverTimeHours;
  String? totalOverTimePrice;
  List<OverTimeDataModel>? data;
  OverTimeModel({
    required this.totalOverTimeSalary,
    required this.totalOverTimeHours,
    required this.totalOverTimePrice,
    required this.data,
  });

  factory OverTimeModel.fromJson(json) {
    return OverTimeModel(
      totalOverTimeSalary: json['data']['totalOverTimeSalary'].toString(),
      totalOverTimeHours: json['data']['totalOverTimeHours'].toString(),
      totalOverTimePrice: json['data']['totalOverTimePrice'].toString(),
      data: (json['data']['overTimeDate'] as List<dynamic>).map((e) {
        return OverTimeDataModel.fromJson(e as Map<String, dynamic>);
      }).toList(),
    );
  }
}
