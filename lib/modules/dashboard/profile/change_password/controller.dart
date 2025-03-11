import 'package:amicus/core/local_services/message_service.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxString oldPwdError = "".obs;
  RxString pwdError = "".obs;
  RxString confirmPwdError = "".obs;

  var oldPwdCtr = TextEditingController();
  var pwdCtr = TextEditingController();
  var confirmPwdCtr = TextEditingController();

  RxBool processing = false.obs;

  RxBool obscureOldPwd = true.obs;
  RxBool obscurePwd = true.obs;
  RxBool obscureConfirmPwd = true.obs;

  toggleOldPwdVisibility() {
    obscureOldPwd.value = !obscureOldPwd.value;
  }

  togglePwdVisibility() {
    obscurePwd.value = !obscurePwd.value;
  }

  toggleConfirmPwdVisibility() {
    obscureConfirmPwd.value = !obscureConfirmPwd.value;
  }

  changePassword() async {
    validateOldPassword();
    validatePassword();
    validateConfirmPassword();


    if (oldPwdCtr.text.trim().isNotEmpty && (pwdError.value == "" && confirmPwdError.value == "")) {
      processing(true);
      await Future.delayed(Duration(milliseconds: 1500));
     MessageService.showSimpleDialog(
          title: AppStrings.passwordChanged,
          message: AppStrings.yourPasswordChanged,onDone: (){
            Get.back();
            Get.back();

     });
      processing(false);
    }
  }

  validatePassword() {
    if (pwdCtr.text
        .trim()
        .isEmpty) {
      pwdError(AppStrings.passwordIsRequired);
    } else if (pwdCtr.text
        .trim()
        .length < 8) {
      pwdError(AppStrings.passwordMustBe8character);
    } else if (!RegExp(r'[A-Z]').hasMatch(pwdCtr.text.trim())) {
      pwdError(AppStrings.passwordMustContainUppercase);
    } else if (!RegExp(r'[a-z]').hasMatch(pwdCtr.text.trim())) {
      pwdError(AppStrings.passwordMustContainLowercase);
    } else if (!RegExp(r'[0-9]').hasMatch(pwdCtr.text.trim())) {
      pwdError(AppStrings.passwordMustContainDigit);
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
        .hasMatch(pwdCtr.text.trim())) {
      pwdError(AppStrings.passwordMustContainSpecialChar);
    } else {
      pwdError("");
    }
  }

  validateOldPassword(){
    if(oldPwdCtr.text.trim().isEmpty){
      oldPwdError.value = AppStrings.enterOldPassword;
    }else{
      oldPwdError("");
    }
  }


  validateConfirmPassword() {
    if (confirmPwdCtr.text.trim() != pwdCtr.text.trim()) {
      confirmPwdError(AppStrings.passwordMisMatch);
    } else {
      confirmPwdError("");
    }
  }



}
