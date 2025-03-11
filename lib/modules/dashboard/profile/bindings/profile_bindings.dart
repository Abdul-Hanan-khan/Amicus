import 'package:amicus/modules/dashboard/profile/change_password/controller.dart';
import 'package:amicus/modules/dashboard/profile/landing/controller/edit_profile_controller.dart';
import 'package:amicus/modules/dashboard/profile/terms/controller/terms_controller.dart';
import 'package:get/get.dart';
class ProfileBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> EditProfileController());
    Get.lazyPut(()=> ChangePasswordController());
    Get.lazyPut(()=> TermsController());
  }

}