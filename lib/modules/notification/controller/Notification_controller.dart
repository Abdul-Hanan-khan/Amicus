import 'dart:convert';
import 'package:amicus/modules/notification/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class NotificationController extends GetxController {
  var notifications = <NotificationModel> [].obs;
  var groupedNotifications = <String, List<NotificationModel>>{}.obs;
  RxBool processing = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    processing(true);

    String jsonData = '''
    {
      "data": [
        {
          "id": 1,
          "message": "Your submission has been successfully sent.",
          "status": "success",
          "timestamp": "2025-03-11T09:00:00Z"
        },
        {
          "id": 2,
          "message": "Your submission has been successfully sent.",
          "status": "success",
          "timestamp": "2025-03-11T10:00:00Z"
        },
        {
          "id": 3,
          "message": "You have some error in your submission",
          "status": "error",
          "timestamp": "2025-03-10T14:00:00Z"
        },
        {
          "id": 4,
          "message": "Your submission has been successfully sent.",
          "status": "success",
          "timestamp": "2025-03-10T16:00:00Z"
        },
        {
          "id": 5,
          "message": "Your submission has been successfully sent.",
          "status": "success",
          "timestamp": "2025-03-09T08:00:00Z"
        }
      ]
    }
    ''';

    Map<String, dynamic> decodedJson = json.decode(jsonData);
    List<dynamic> data = decodedJson['data'];
    notifications.value = data.map((item) => NotificationModel.fromJson(item)).toList();
    groupNotificationsByDate();
    await Future.delayed(Duration(milliseconds: 1500));
    processing(false);
  }

  void groupNotificationsByDate() {
    var tempGrouped = <String, List<NotificationModel>>{};
    for (var notification in notifications) {
      String dateKey = formatDate(notification.timestamp!);
      tempGrouped.putIfAbsent(dateKey, () => []).add(notification);
    }
    groupedNotifications.value = tempGrouped;
  }

  String formatDate(String timestamp) {
    DateTime date = DateTime.parse(timestamp).toLocal();
    DateTime now = DateTime.now();
    if (DateFormat('yyyy-MM-dd').format(date) == DateFormat('yyyy-MM-dd').format(now)) {
      return "Today";
    } else {
      return DateFormat('d MMMM yyyy').format(date);
    }
  }
}
