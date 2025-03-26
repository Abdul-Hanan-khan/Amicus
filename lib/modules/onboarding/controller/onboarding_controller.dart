import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/modules/onboarding/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPageIndex = 0.obs;
  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": AppAssets.onboarding1,
      "title": AppStrings.welcomeToAmicus,
      "description": AppStrings.easilyCapturePhotosAndSubmit,
      "widget": false,

    },
    {
      "image":AppAssets.onboarding2,
      "title": AppStrings.howToTakePhoto,
      "description": AppStrings.useInAppCamera,
      "widget": false,

    },
    {
      "image": AppAssets.onboarding3,
      "title": AppStrings.allowYourLocation,
      "description": AppStrings.weNeedYourLocation,
      "widget": true,
    },

    {
      "image": AppAssets.onboarding4,
      "title": AppStrings.enableCameraAccess,
      "description": AppStrings.allowAmicusToAccessPhotos,
      "widget": true,

    },
  ];

  void nextPage() {
    if (currentPageIndex.value < onboardingData.length - 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Get.offAllNamed(AppRoutes.login);
      // Navigate to Home or Login Screen
    }
  }

}
