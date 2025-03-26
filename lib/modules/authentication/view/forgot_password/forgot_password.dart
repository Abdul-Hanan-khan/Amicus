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

class ForgotPassword extends StatelessWidget {



  ForgotPasswordController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    print("widget build forgotpassword");
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

        Positioned(
            left: 20.w,
            top: 10.h,
            child: BackWidget())
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
            text: AppStrings.forgotPassword,
            // fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            fontFamily: AppFonts.spartanBold,
          ),

          CustomText(
            text: AppStrings.pleaseEnterYourEmail,
            fontSize: 14.sp,
            fontColor: myColors.black.setOpacity(0.7),
          ).marginOnly(top: 11.h),

          CustomTextField(
              errorMessage: controller.errorPhone,
              label: AppStrings.phoneNumber,
              bgcolor: Colors.transparent,
              controller: controller.phoneNumberCtr,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: myColors.black,fontFamily: AppFonts.almarai),
              labelStyle: TextStyle(color: Colors.grey,fontFamily: AppFonts.almarai),
              border: true,
              onChange: (v) {
                controller.validatePhone();
              },
              // borderColor:myColors.primaryColor,
              radius: 10.r,
              prefixIcon:
              ImageViewer(url: AppAssets.iconPhone).paddingAll(16.sp))
              .marginOnly(top: 28.h),

          Obx(
                ()=> CustomButton(
              isProcessing: controller.otpProcessing.value,
              onTap: () {
                controller.getResetOTP();
              },
              buttonText: AppStrings.getOtp,
            ).marginOnly(top: 55.h, bottom: 10.h),
          )
        ],
      ),
    );
  }

  Widget _phonePinput(RegisterController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pinput(
          length: 5,
          controller: controller.otpController,
          defaultPinTheme: PinTheme(
            width: 43.sp,
            height: 43.sp,
            textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 50.sp,
            height: 50.sp,
            textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
              color: myColors.primary.setOpacity(0.051),
              shape: BoxShape.circle,
              border: Border.all(color: myColors.primary, width: 2),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: 50.sp,
            height: 50.sp,
            textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: myColors.primary),
            decoration: BoxDecoration(
              color: myColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: myColors.primary),
            ),
          ),
          onCompleted: (otp) {
            print("OTP Entered: $otp");
          },
          // onChanged: (otp) {
          //   controller.otpPhoneNumber = otp;
          // },
        ),
      ],
    );
  }
}
