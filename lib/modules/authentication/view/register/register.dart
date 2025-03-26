import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/custom_text_field.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/authentication/controller/login_controller.dart';
import 'package:amicus/modules/authentication/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print("widget build register");

    return BaseScaffold(
      top: true,
      // bottom: true,
      // isAuthentication: true,
      backgroundColor: myColors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: myColors.black,

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          LayoutBuilder(
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
          Container(width: Get.width,height: 30.hr(context),color: Colors.white,)
        ],
      ),
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
            Row(
              children: [
                CustomText(
                  text: AppStrings.alreadyHaveAnAccount,
                  fontColor: myColors.white,
                  fontFamily: AppFonts.helveticaNeue,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(AppRoutes.login);
                  },
                  child: CustomText(
                    text: AppStrings.login,
                    fontColor: myColors.primary,
                    fontFamily: AppFonts.helveticaNeue,
                  ).paddingOnly(left: 7.w),
                )
              ],
            ).marginOnly(top: 44.h),
          ],
        ).paddingSymmetric(horizontal: 21.w),

      ],
    );
  }

  Widget inputSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 19.w, right: 21.w, top: 24.h,bottom: 10.h),
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
            text: AppStrings.createAccount,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            fontFamily: AppFonts.helveticaNeueBold,
          ),
          CustomText(
            text: AppStrings.goodToSeeYou,
            fontSize: 14.sp,
            fontColor: myColors.black.setOpacity(0.7),
          ).marginOnly(top: 11.h),
          CustomTextField(
            errorMessage: controller.errorFullName,
            label: AppStrings.fullName,
            bgcolor: Colors.transparent,
            controller: controller.fullNameCtr,
            style: TextStyle(color: myColors.black,fontFamily: AppFonts.almarai),
            labelStyle: TextStyle(color: Colors.grey,fontFamily: AppFonts.almarai),

            // validate: controller.validateEmail() ,
            border: true,
            onChange: (value) => controller.validateFullName(),
            // borderColor:myColors.primaryColor,
            radius: 10.r,
            prefixIcon: ImageViewer(url: AppAssets.iconPerson).paddingAll(16.sp),
          ).marginOnly(top: 21.h),


          CustomTextField(
            errorMessage: controller.errorPhone,
            label: AppStrings.phoneNumber,
            bgcolor: Colors.transparent,
            controller: controller.phoneNumberCtr,
            style: TextStyle(color: myColors.black,fontFamily: AppFonts.almarai),
            labelStyle: TextStyle(color: Colors.grey,fontFamily: AppFonts.almarai),

            // validate: controller.validateEmail() ,
            border: true,
            onChange: (value) => controller.validatePhone(),
            // borderColor:myColors.primaryColor,
            radius: 10.r,
            prefixIcon: ImageViewer(url: AppAssets.iconPhone).paddingAll(16.sp),
          ).marginOnly(top: 10.h),
          CustomTextField(
            errorMessage: controller.errorEmail,
            label: AppStrings.emailAddress,
            bgcolor: Colors.transparent,
            controller: controller.emailCtr,
            keyboardType: TextInputType.emailAddress,style: TextStyle(color: myColors.black,fontFamily: AppFonts.almarai),
            labelStyle: TextStyle(color: Colors.grey,fontFamily: AppFonts.almarai),

            // validate: controller.validateEmail() ,
            border: true,
            onChange: (value) => controller.validateEmail(),
            // borderColor:myColors.primaryColor,
            radius: 10.r,
            prefixIcon: ImageViewer(url: AppAssets.iconMail).paddingAll(16.sp),
          ).marginOnly(top: 10.h),
          Obx(
            ()=> CustomTextField(
              errorMessage: controller.errorPassword,
              controller: controller.passwordCtr,
              label: AppStrings.password,
              bgcolor: Colors.transparent,
              style: TextStyle(color: myColors.black,fontFamily: AppFonts.almarai),
              labelStyle: TextStyle(color: Colors.grey,fontFamily: AppFonts.almarai),

              border: true,
              onChange: (v) {
                controller.validatePassword();
              },
              radius: 10.r,
              prefixIcon: ImageViewer(url: AppAssets.iconKey).paddingAll(16.sp),
              suffixIcon:  GestureDetector(
                onTap: () {
                  controller.togglePasswordVisibility();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageViewer(url: AppAssets.iconVisibility).paddingAll(14.sp),
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
              obsecureText: controller.obscurePassword.value,
            ).marginOnly(top: 10.h),
          ),

          SizedBox(height: 20.hr(context),),
          Container(
            // color: Colors.orange.setOpacity(0.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => GestureDetector(
                  onTap: (){
                    controller.termsAccepted.value=!controller.termsAccepted.value;
                  },
                  child: CustomContainer(

                    duration: Duration(milliseconds: 200),
                    width: 18.spr(context),
                    height: 18.spr(context),
                    decoration: BoxDecoration(
                      color: controller.termsAccepted.value?myColors.primary:Colors.white,
                      borderRadius: BorderRadius.circular(5.rr(context)),
                      border: Border.all(color:controller.termsAccepted.value?Colors.transparent: myColors.grey),
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: myColors.white,
                      size: 15.spr(context),
                    ),
                  ),
                )),
                CustomText(
                  text: AppStrings.agreeToAll,
                  fontSize: 13.sp,
                  fontColor: myColors.black,
                ).marginOnly(left: 10.wr(context)),
                CustomText(
                  text: AppStrings.termsNConditions,
                  fontSize: 13.sp,
                  fontColor: myColors.primary,
                ).marginOnly(left: 5.w,top: 3.hr(context)),
              ],
            ),
          ),

          Obx(
              ()=> CustomButton(
                buttonText: AppStrings.createAccount,
                isProcessing: controller.otpProcessing.value,
                onTap: () {
                  controller.sendOTP(context);
                })
                .marginOnly(top: 12.h),
          ).marginOnly(top: 20.hr(context)),
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
                    border: Border.all(color: myColors.grey.setOpacity(0.7))),
                child: Center(
                  child: ImageViewer(url: AppAssets.iconGoogle),
                ),
              ),
              Container(
                height: 50.sp,
                width: 50.sp,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: myColors.grey.setOpacity(0.7))),
                child: Center(
                  child: ImageViewer(url: AppAssets.iconApple),
                ),
              ),
            ],
          ).marginOnly(top: 30.h,bottom: 35.h)
        ],
      ),
    );
  }
}