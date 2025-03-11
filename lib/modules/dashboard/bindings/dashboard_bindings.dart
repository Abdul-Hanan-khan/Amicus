import 'package:amicus/modules/dashboard/home/controller/home_controller.dart';
import 'package:amicus/modules/dashboard/home/earnings/controller/my_earnings_controller.dart';
import 'package:amicus/modules/dashboard/profile/landing/controller/profile_controller.dart';
import 'package:amicus/modules/dashboard/report/controller/report_controller.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>ProfileController());
    Get.lazyPut(()=>MyEarningsController(),fenix: true);
    Get.lazyPut(()=>ReportController(),fenix: true);
  }

}