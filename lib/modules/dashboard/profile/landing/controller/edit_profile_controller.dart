import 'dart:io';


import 'package:amicus/core/local_services/message_service.dart';
import 'package:amicus/core/local_services/picker_service.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class EditProfileController extends GetxController{
  RxInt selectedMenuItemIndex = (1000000.obs);
  String pickedImagePath = '';
  var imageFile = Rxn<File>();
  var name = TextEditingController(text: "Ahsan");
  var emailCtr = TextEditingController(text: "oyeslow@gmail.com");
  var phoneNumberCtr = TextEditingController(text: "+9233465983258");

  RxBool updating = false.obs;

  RxString errorName ="".obs;
  RxString errorEmail ="".obs;
  RxString errorPassword ="".obs;
  RxString errorConfirmPassword ="".obs;
  RxString errorPhone ="".obs;

  RxBool passwordVisibility = true.obs;
  RxBool confirmPasswordVisibility = true.obs;
  RxBool loadingProfile=true.obs;

  @override
  void onInit() {
    loadProfileInfo();
    // TODO: implement onInit
    super.onInit();
  }

  loadProfileInfo()async{
    await Future.delayed(Duration(seconds: 3),(){
      loadingProfile(false);
    });
  }

  validateName(String value) {
    if (value.isEmpty) {
      errorName(AppStrings.firstNameRequired);
    } else {
      errorName("");
    }
  }



  validateEmail(String value) {
    final emailRegex =
    RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (value.isEmpty) {
      errorEmail(AppStrings.emailRequired);
    } else if (!emailRegex.hasMatch(value)) {
      errorEmail(AppStrings.enterValidEmailAddress);
    } else {
      errorEmail("");
    }
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      errorPassword(AppStrings.passwordIsRequired);
    } else if (value.length < 8) {
      errorPassword(AppStrings.passwordMustBe8character);
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      errorPassword(AppStrings.passwordMustContainUppercase);
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      errorPassword(AppStrings.passwordMustContainLowercase);
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      errorPassword(AppStrings.passwordMustContainDigit);
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      errorPassword(AppStrings.passwordMustContainSpecialChar);
    } else {
      errorPassword("");
    }
  }


  validatePhone(String value) {
    if (value.isEmpty) {
      errorPhone(AppStrings.enterAValidPhoneNumber);
    } else {
      errorPhone("");
    }
  }

  togglePasswordVisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  toggleConfirmPasswordVisibility() {
    confirmPasswordVisibility.value = !confirmPasswordVisibility.value;
  }


  uploadPhotoFromGallery() {
    FilePickerService.pick().then((value) {
      if (value != null) {
        // issueImage.value = value.fileNameWithExtension;
        pickedImagePath = value.path??'';
        imageFile.value = value.file??File("");
      }
    });
    Get.back();
  }

  takePhoto() {
    FilePickerService.captureFromCamera().then((value) {
      if (value != null) {
        // issueImage.value = value.fileNameWithExtension;3
        pickedImagePath= value.path??"";

        imageFile.value = value.file;
      }
    });
    Get.back();
  }


  updateProfile()async{

    updating(true);
    await Future.delayed(Duration(milliseconds: 1500));
    updating(false);
    MessageService.showSimpleDialog(title: AppStrings.profileUpdated,message: AppStrings.yourInfoUpdated,barrierDismissible: true);


    // Get.back();
  }
}