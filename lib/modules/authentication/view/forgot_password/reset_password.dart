import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/maskings/maskings.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/core/widgets/back_widget.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/custom_text_field.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/authentication/controller/forgot_password_controller.dart';
import 'package:amicus/modules/authentication/controller/login_controller.dart';
import 'package:amicus/modules/authentication/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ResetPassword extends StatelessWidget {
  ForgotPasswordController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print("widget build reset password");
    return BaseScaffold(
      top: true,
      backgroundColor: myColors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: myColors.black,

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
                    Expanded(child: inputSection(context))
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
    return Stack(
      children: [
        Column(
          children: [
            ImageViewer(
              width: 222.w,
              height: 112.h,
              url: AppAssets.appLogo,
              color: myColors.white,
            ).marginOnly(top: 5.h),
            SizedBox(
              height: 44.h,
              width: double.infinity,
            )
          ],
        ).paddingSymmetric(horizontal: 21.w),
        Positioned(left: 20.w, top: 10.h, child: BackWidget())
      ],
    );
  }

  Widget inputSection(BuildContext context) {
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
            text: AppStrings.resetYourPassword,
            // fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            fontFamily: AppFonts.helveticaNeueBold,
          ),
          CustomText(
            text: AppStrings.pleaseEnterNewPassword,
            fontSize: 14.sp,
            fontColor: myColors.black.setOpacity(0.7),
          ).marginOnly(top: 11.h),
          Obx(
            () => CustomTextField(
                    errorMessage: controller.errorPassword,
                    label: AppStrings.password,
                    bgcolor: Colors.transparent,
                    controller: controller.passwordCtr,
                    keyboardType: TextInputType.visiblePassword,
                    obsecureText: controller.obscurePassword.value,
                style: TextStyle(color: myColors.black,fontFamily: AppFonts.almarai),
                labelStyle: TextStyle(color: Colors.grey,fontFamily: AppFonts.almarai),
                    border: true,
                    onChange: (v) {
                      controller.validatePassword();
                    },
                    // borderColor:myColors.primaryColor,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.togglePasswordVisibility();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ImageViewer(url: AppAssets.iconVisibility)
                              .paddingAll(14.sp),
                          if (!controller.obscurePassword.value)
                            Transform.rotate(
                              angle: 30 * (3.14159265359 / 180),
                              child: Container(
                                height: 17.h,
                                width: 1.w,
                                color: myColors.grey,
                              ),
                            )
                        ],
                      ),
                    ),
                    radius: 10.r,
                    prefixIcon:
                        ImageViewer(url: AppAssets.iconKey).paddingAll(16.sp))
                .marginOnly(top: 28.h),
          ),
          Obx(
            () => CustomTextField(
                    errorMessage: controller.errorConfirmPassword,
                    label: AppStrings.confirmPassword,
                    bgcolor: Colors.transparent,
                    controller: controller.confirmPasswordCtr,
                    keyboardType: TextInputType.visiblePassword,
                    border: true,
                    obsecureText: controller.obscureConfirmPassword.value,
                style: TextStyle(color: myColors.black,fontFamily: AppFonts.almarai),
                labelStyle: TextStyle(color: Colors.grey,fontFamily: AppFonts.almarai),
                    onChange: (v) {
                      controller.validateConfirmPassword();
                    },
                    // borderColor:myColors.primaryColor,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.toggleConfirmPasswordVisibility();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ImageViewer(url: AppAssets.iconVisibility)
                              .paddingAll(14.sp),
                          if (!controller.obscureConfirmPassword.value)
                            Transform.rotate(
                              angle: 30 * (3.14159265359 / 180),
                              child: Container(
                                height: 17.h,
                                width: 1.w,
                                color: myColors.grey,
                              ),
                            )
                        ],
                      ),
                    ),
                    radius: 10.r,
                    prefixIcon:
                        ImageViewer(url: AppAssets.iconKey).paddingAll(16.sp))
                .marginOnly(top: 15.h),
          ),
          Obx(
            () => CustomButton(
              isProcessing: controller.resetPwdProcessing.value,
              onTap: () {
                controller.resetPassword();
              },
              buttonText: AppStrings.changePassword,
            ).marginOnly(top: 55.h, bottom: 10.h),
          )
        ],
      ),
    );
  }
}
