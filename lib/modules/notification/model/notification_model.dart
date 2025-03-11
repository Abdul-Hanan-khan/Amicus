class NotificationModel {
  final int id;
  final String message;
  final String status;
  final String timestamp;

  NotificationModel({
    required this.id,
    required this.message,
    required this.status,
    required this.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      message: json['message'],
      status: json['status'],
      timestamp: json['timestamp'],
    );
  }
}
