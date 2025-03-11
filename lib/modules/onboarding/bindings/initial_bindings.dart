import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/modules/authentication/controller/login_controller.dart';
import 'package:amicus/modules/dashboard/Landing/controller/dashhboard_controller.dart';
import 'package:amicus/modules/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> DashboardController(),fenix: true);
    Get.lazyPut(()=> LoginController(),fenix: true);
  }

}