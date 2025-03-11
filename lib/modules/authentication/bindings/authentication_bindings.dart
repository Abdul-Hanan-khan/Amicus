import 'package:amicus/modules/authentication/controller/forgot_password_controller.dart';
import 'package:amicus/modules/authentication/controller/login_controller.dart';
import 'package:amicus/modules/authentication/controller/register_controller.dart';
import 'package:get/get.dart';

class AuthenticationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> RegisterController());
    Get.lazyPut(()=> ForgotPasswordController());
  }
}