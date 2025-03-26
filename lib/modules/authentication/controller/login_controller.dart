import 'package:amicus/core/local_services/message_service.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool acceptSignInWithTouchAndFace = false.obs;
  RxBool obscurePassword = true.obs;

  var emailCtr = TextEditingController();
  var passwordCtr = TextEditingController();

  RxString errorMessageEmail = "".obs;
  RxString errorMessagePassword = "".obs;


  @override
  void onInit() {
    super.onInit();
  }

  validateEmail() {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (emailCtr.text.trim().isEmpty) {
      errorMessageEmail( AppStrings.emailRequired);
    }
    else if (!emailRegex.hasMatch(emailCtr.text.trim())) {
      errorMessageEmail(AppStrings.enterValidEmailAddress) ;
    }else{
      errorMessageEmail("");
    }
  }

  validatePassword(){
    if(passwordCtr.text.trim().isEmpty){
      errorMessagePassword(AppStrings.passwordIsRequired);
    }else{
      errorMessagePassword("");
    }
  }

  togglePasswordVisibility(){
    obscurePassword(!obscurePassword.value) ;
  }


  bool validateAll(){
    validateEmail();
    validatePassword();
    if (errorMessageEmail.value == "" && errorMessagePassword.value == ""){
      return true;
    }else{
      return false;
    }
  }


  Future<void> performLogin() async {

    if(validateAll()){
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

}