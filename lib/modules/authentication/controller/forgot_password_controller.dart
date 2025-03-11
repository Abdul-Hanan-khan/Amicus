import 'package:amicus/core/local_services/message_service.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxString errorPhone = "".obs;
  RxString errorPassword = "".obs;
  RxString errorConfirmPassword = "".obs;
  var phoneNumberCtr = TextEditingController();
  var otpController = TextEditingController();
  var passwordCtr = TextEditingController();
  var confirmPasswordCtr = TextEditingController();
  RxBool otpProcessing = false.obs;
  RxBool resetPwdProcessing = false.obs;
  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;

  validatePhone() {
    if (phoneNumberCtr.text.trim().isEmpty) {
      errorPhone(AppStrings.phoneNumberRequired);
    } else {
      errorPhone("");
    }
  }

  validatePassword() {
    if (passwordCtr.text.trim().isEmpty) {
      errorPassword(AppStrings.passwordIsRequired);
    } else if (passwordCtr.text.trim().length < 8) {
      errorPassword(AppStrings.passwordMustBe8character);
    } else if (!RegExp(r'[A-Z]').hasMatch(passwordCtr.text.trim())) {
      errorPassword(AppStrings.passwordMustContainUppercase);
    } else if (!RegExp(r'[a-z]').hasMatch(passwordCtr.text.trim())) {
      errorPassword(AppStrings.passwordMustContainLowercase);
    } else if (!RegExp(r'[0-9]').hasMatch(passwordCtr.text.trim())) {
      errorPassword(AppStrings.passwordMustContainDigit);
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
        .hasMatch(passwordCtr.text.trim())) {
      errorPassword(AppStrings.passwordMustContainSpecialChar);
    } else {
      errorPassword("");
    }
  }

  validateConfirmPassword() {
    if (passwordCtr.text.trim() != confirmPasswordCtr.text.trim()) {
      errorConfirmPassword(AppStrings.passwordMisMatch);
    } else {
      errorConfirmPassword("");
    }
  }

  getResetOTP() async {
    if (phoneNumberCtr.text.trim().isEmpty) {
      MessageService.showSnackBar(
        message: AppStrings.pleaseProvideUsLinkedPhone,
      );
    } else if (errorPhone.value.isNotEmpty) {
      MessageService.showSnackBar(
        message: AppStrings.enterValidEmailAddress,
      );
    } else {
      otpProcessing(true);
      await Future.delayed(Duration(milliseconds: 1500), () {
        otpProcessing(false);
        Get.toNamed(AppRoutes.otpScreen,
            arguments: Get.find<ForgotPasswordController>());
      });
    }
  }

  Future confirmOTP(BuildContext context) async {
    if (otpController.text.trim().isNotEmpty &&
        otpController.text.trim().length == 5) {
      /// otp verification logic here
      otpProcessing(true);
      await Future.delayed(Duration(milliseconds: 1500), () {
        otpController.clear();
        Get.offNamed(AppRoutes.resetPassword);
        otpProcessing(false);
      });
    }
  }

  bool isResetPwdValidated() {
    validatePassword();
    validateConfirmPassword();

    if (errorPassword.value == "" &&
        errorConfirmPassword.value == "") {
      return true;
    } else {
      return false;
    }
  }

  resetPassword() async {

    if(isResetPwdValidated()){
      resetPwdProcessing(true);
      await Future.delayed(Duration(milliseconds: 1500),(){

        MessageService.showSuccessDialog(
            title: AppStrings.passwordChanged,
            message: AppStrings.yourPasswordChanged,
            barrierDismissible: false,
          onDone: (){
            Get.offAllNamed(AppRoutes.login);
          }

        );
        resetPwdProcessing(false);
      });
    }

  }

  togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }
}
