import 'package:amicus/core/local_services/message_service.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var fullNameCtr = TextEditingController();

  var emailCtr = TextEditingController();
  var passwordCtr = TextEditingController();
  var confirmPasswordCtr = TextEditingController();
  var otpController = TextEditingController();

  var phoneNumberCtr = TextEditingController();

  // String otpPhoneNumber = "";
  RxBool termsAccepted = false.obs;
  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool otpProcessing = false.obs;
  RxString errorEmail = "".obs;
  RxString errorFullName = "".obs;
  RxString errorPhone = "".obs;
  RxString errorPassword = "".obs;
  RxString errorConfirmPassword = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  validateFullName() {
    if (fullNameCtr.text.trim().isEmpty) {
      errorFullName(AppStrings.firstNameRequired);
    } else {
      errorFullName("");
    }
  }

  validateEmail() {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (emailCtr.text.trim().isEmpty) {
      errorEmail(AppStrings.emailRequired);
    } else if (!emailRegex.hasMatch(emailCtr.text.trim())) {
      errorEmail(AppStrings.enterValidEmailAddress);
    } else {
      errorEmail("");
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

  validatePhone() {
    if (phoneNumberCtr.text.trim().isEmpty) {
      errorPhone(AppStrings.phoneNumberRequired);
    } else {
      errorPhone("");
    }
  }

  bool validateAll() {
    validateFullName();
    validateEmail();
    validatePassword();
    validatePhone();
    if (errorFullName.value == "" &&
        errorPassword.value == "" &&
        errorEmail.value == "" &&
        errorPhone.value == "") {
      return true;
    } else {
      return false;
    }
  }

  toggleTermAndConditions() {
    termsAccepted.value = !termsAccepted.value;
  }

  togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> sendOTP(BuildContext context) async {
    if (!validateAll()) {
      MessageService.showSnackBar(
          message: AppStrings.allFieldsAreRequired, isSuccess: false);
    } else if (!termsAccepted.value) {
      MessageService.showSnackBar(
          message: AppStrings.pleaseAgreeTerms, isSuccess: false);
    } else {
      otpProcessing(true);
      await Future.delayed(Duration(milliseconds: 1500));
      otpProcessing(false);
      Get.toNamed(AppRoutes.otpScreen,
          arguments: Get.find<RegisterController>());
    }
  }

  Future confirmOTP(BuildContext context) async {
    if (otpController.text.trim().isNotEmpty &&
        otpController.text.trim().length == 5) {
      /// otp verification logic here
      otpProcessing(true);
      await Future.delayed(Duration(milliseconds: 1500), () {
        otpController.clear();
        MessageService.showSuccessDialog(
            title: AppStrings.verificationComplete,
            message: AppStrings.congratulationsYourAccountCreated,
            barrierDismissible: false);
        otpProcessing(false);
      });
    }
  }
}
