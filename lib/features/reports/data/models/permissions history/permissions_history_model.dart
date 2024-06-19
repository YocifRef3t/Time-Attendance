import 'package:time_attendance/features/reports/data/models/permissions%20history/permission_model.dart';

class PermissionsHistoryModel {
  final int requestsCount;
  final List<PermissionModel> permissions;
  PermissionsHistoryModel({
    required this.requestsCount,
    required this.permissions,
  });

  factory PermissionsHistoryModel.fromJson(json) {
    return PermissionsHistoryModel(
      requestsCount: json['data']['requestsCount'] as int,
      permissions: (json['data']['permissions'] as List<dynamic>)
          .map((e) => PermissionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
