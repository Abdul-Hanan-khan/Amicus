import 'package:amicus/modules/notification/controller/Notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
    // TODO: implement dependencies
  }
}
