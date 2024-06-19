class NotificationModel {
  final String id;
  final String title;
  final DateTime time;
  final String subtitle;
  NotificationModel({
    required this.id,
    required this.title,
    required this.time,
    required this.subtitle,
  });

  factory NotificationModel.fromJson(json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      time: DateTime.parse(json['created_at']),
      subtitle: json['subtitle'] ?? "",
    );
  }
}
