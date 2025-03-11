
import 'package:amicus/core/routes/app_routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool loadingProfile = false.obs;

  fetchUserProfileInfo() async {
    loadingProfile(true);
    await Future.delayed(Duration(milliseconds: 1500));
    loadingProfile(false);
  }


  logout(){
    Get.offAllNamed(AppRoutes.landing);
  }
}
