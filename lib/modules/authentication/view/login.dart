import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/custom_text_field.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/authentication/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print("widget build LOGIN");

    return BaseScaffold(
      top: true,
      backgroundColor: myColors.black,
      statusBarIconBrightness: Brightness.light,

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                // Makes the column take the least height required
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width,
                    ),
                    topSection(),
                    Expanded(child: inputSection())
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       SizedBox(
      //         width: Get.width,
      //       ),
      //       topSection(),
      //       Expanded(child: inputSection())
      //     ],
      //   ),
      // ),
    );
  }

  Widget topSection() {
    return Column(
      children: [
        ImageViewer(
          width: 222.w,
          height: 112.h,
          url: AppAssets.appLogo,
          color: myColors.white,
        ).marginOnly(top: 5.h),
        Row(
          children: [
            CustomText(
              text: AppStrings.firstTimeHere,
              fontColor: myColors.white,
              fontFamily: AppFonts.helveticaNeue,
            ),
            GestureDetector(
              onTap: (){
                Get.offNamed(AppRoutes.register);
              },
              child: CustomText(
                text: AppStrings.signUP,
                fontColor: myColors.primary,
                fontFamily: AppFonts.helveticaNeue,
              ).paddingOnly(left: 7.w),
            )
          ],
        ).marginOnly(top: 44.h),
      ],
    ).paddingSymmetric(horizontal: 21.w);
  }

  Widget inputSection() {
    return Container(
      padding: EdgeInsets.only(left: 19.w, right: 21.w, top: 24.h),
      margin: EdgeInsets.only(top: 17.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.letsSignYouIn,
            fontSize: 20.sp,
            fontFamily: AppFonts.helveticaNeueBold,
          ),
          CustomText(
            text: AppStrings.welcomeBackYouWereMissed,
            fontSize: 14.sp,
            fontColor: myColors.black.setOpacity(0.7),
          ).marginOnly(top: 11.h),
          CustomTextField(
                  errorMessage: controller.errorMessageEmail,
                  label: AppStrings.email,
                  bgcolor: Colors.transparent,
                  controller: controller.emailCtr,
                  keyboardType: TextInputType.emailAddress,
                  border: true,
                  onChange: (v) {
                    controller.validateEmail();
                  },
                  // borderColor:myColors.primaryColor,
                  radius: 10.r,
                  prefixIcon:
                      ImageViewer(url: AppAssets.iconMail).paddingAll(12.sp))
              .marginOnly(top: 28.h),
          CustomTextField(
            errorMessage: controller.errorMessagePassword,
            controller: controller.passwordCtr,
            label: AppStrings.password,
            bgcolor: Colors.transparent,
            keyboardType: TextInputType.visiblePassword,
            border: true,
            onChange: (v) {
              controller.validatePassword();
            },
            radius: 10.r,
            prefixIcon: ImageViewer(url: AppAssets.iconKey).paddingAll(12.sp),
            obsecureText: true,
          ).marginOnly(top: 20.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.forgotPassword);
                },
                child: CustomText(
                  text: AppStrings.forgotPassword,
                  fontColor: myColors.primary,
                  fontSize: 14.sp,
                ).marginOnly(top: 5.h),
              )
            ],
          ),
          Row(
            children: [
              Obx(() => Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: myColors.primary,
                    side: BorderSide(color: myColors.grey),
                    value: controller.acceptSignInWithTouchAndFace.value,
                    onChanged: (value) {
                      controller.acceptSignInWithTouchAndFace.value = value!;
                    },
                  )),
              CustomText(
                text: AppStrings.acceptSignInWith,
                fontSize: 14.sp,
              ),
            ],
          ).marginOnly(top: 37.h),
          CustomButton(
              buttonText: AppStrings.login,
              onTap: () {
                controller.performLogin();
              }).marginOnly(top: 23.h),
          Row(
            children: [
              Expanded(
                  child: Divider(
                color: myColors.grey,
              )),
              CustomText(
                text: AppStrings.orLoginWith,
                fontSize: 12.sp,
              ).marginSymmetric(horizontal: 13.w),
              Expanded(
                  child: Divider(
                color: myColors.grey,
              ))
            ],
          ).marginOnly(left: 29.w, right: 29.w, top: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50.sp,
                width: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: myColors.grey.setOpacity(0.7))
                ),
                child: Center(child: ImageViewer(url: AppAssets.iconGoogle),),
              ),

              Container(
                height: 50.sp,
                width: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: myColors.grey.setOpacity(0.7))
                ),
                child: Center(child: ImageViewer(url: AppAssets.iconApple),),
              ),
            ],
          ).marginOnly(top: 45.h).paddingOnly(bottom: 15.h)
        ],
      ),
    );
  }
}
