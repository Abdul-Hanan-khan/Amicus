import 'package:amicus/core/local_services/location_service.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final OnboardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      top: true,
        backgroundColor: myColors.white,
        statusBarIconBrightness: Brightness.dark,
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onboardingData.length,
            onPageChanged: (index) =>
            controller.currentPageIndex.value = index,
            itemBuilder: (context, index) {
              final item = controller.onboardingData[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(item["image"]!, height: 250),
                  SizedBox(height: 20),
                  CustomText(
                      text: item["title"]!,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomText(
                      text: item["description"]!,
                      textAlign: TextAlign.center,
                      fontSize: 14.sp,
                    ),
                  ),
                  if (item["widget"] != false && index == 2)
                    onBoarding3Widget().marginOnly(top: 30.h),
                  if (item["widget"] != false && index == 3)
                    onBoarding4Widget().marginOnly(top: 30.h)
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Row(
                children: List.generate(
                  controller.onboardingData.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: controller.currentPageIndex.value == index
                        ? 33.w
                        : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: controller.currentPageIndex.value == index
                          ? myColors.primary
                          : Colors.grey,
                    ),
                  ),
                ),
              )),
              FloatingActionButton(
                onPressed: controller.nextPage,
                backgroundColor: myColors.primary,
                child: Icon(Icons.arrow_forward, color: Colors.black),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r)),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget onBoarding3Widget() {
    return Column(
      children: [
        CustomButton(
          onTap: () async{
            await MyLocationService.requestLocationPermission().then((value){
              controller.nextPage();
              print(value);
            }).catchError((error){
              print(error);
            });
          },
          buttonText: AppStrings.allowAccess,
          buttonColor: myColors.primary,
        ),
        CustomButton(
          onTap: () {
            controller.nextPage();
          },
          buttonText: AppStrings.notNow,
          buttonColor: myColors.black,
          buttonTextColor: myColors.white,
        ).marginOnly(top: 5.h)
      ],
    ).paddingSymmetric(horizontal: 20.w);
  }

  Widget onBoarding4Widget() {
    return Column(
      children: [
        CustomButton(
          onTap: () {},
          buttonText: AppStrings.allowAccess,
          buttonColor: myColors.primary,
        ),
        CustomButton(
          onTap: () {
            controller.nextPage();
          },
          buttonText: AppStrings.notNow,
          buttonColor: myColors.black,
          buttonTextColor: myColors.white,
        ).marginOnly(top: 5.h)
      ],
    ).paddingSymmetric(horizontal: 20.w);
  }
}
