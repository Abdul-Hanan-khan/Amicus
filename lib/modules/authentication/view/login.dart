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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print("widget build LOGIN");

    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: myColors.black,
    //     statusBarIconBrightness: Brightness.light,
    //   ),
    // );
    return BaseScaffold(
      top: true,
      // bottom: true,
// isAuthentication: true,
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
                    topSection(context),
                    Expanded(child: inputSection(context)),

                    // Container(height: 10.hr(context),color: Colors.white,).marginZero
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

  Widget topSection(BuildContext context) {
    return Column(
      children: [
        ImageViewer(
          width: 222.wr(context),
          height: 112.hr(context),
          url: AppAssets.appLogo,
          color: myColors.white,
        ).marginOnly(top: 5.hr(context)),
        Row(
          children: [
            CustomText(
              text: AppStrings.firstTimeHere,
              fontColor: myColors.white,
              fontFamily: AppFonts.helveticaNeue,
            ),
            GestureDetector(
              onTap: () {
                Get.offNamed(AppRoutes.register);
              },
              child: CustomText(
                text: AppStrings.signUP,
                fontColor: myColors.primary,
                fontFamily: AppFonts.helveticaNeue,
              ).paddingOnly(left: 7.wr(context)),
            )
          ],
        ).marginOnly(top: 44.hr(context)),
      ],
    ).paddingSymmetric(horizontal: 21.wr(context));
  }

  Widget inputSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 19.wr(context), right: 21.wr(context), top: 24.hr(context)),
      margin: EdgeInsets.only(top: 17.hr(context)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.rr(context)),
              topLeft: Radius.circular(20.rr(context)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.letsSignYouIn,
            fontSize: 20.spr(context),
            fontFamily: AppFonts.helveticaNeueBold,
          ),
          CustomText(
            text: AppStrings.welcomeBackYouWereMissed,
            fontSize: 14.spr(context),
            fontColor: myColors.black.setOpacity(0.7),
          ).marginOnly(top: 11.hr(context)),
          CustomTextField(
                  errorMessage: controller.errorMessageEmail,
                  label: AppStrings.email,
                  bgcolor: Colors.transparent,
                  controller: controller.emailCtr,
                  keyboardType: TextInputType.emailAddress,
                  border: true,
                  style: TextStyle(
                      color: myColors.black, fontFamily: AppFonts.almarai),
                  labelStyle: TextStyle(
                      color: Colors.grey, fontFamily: AppFonts.almarai),
                  onChange: (v) {
                    controller.validateEmail();
                  },
                  // borderColor:myColors.primaryColor,
                  radius: 10.rr(context),
                  prefixIcon: ImageViewer(url: AppAssets.iconMail)
                      .paddingAll(17.spr(context)))
              .marginOnly(top: 28.hr(context)),
          Obx(
            ()=> CustomTextField(
              errorMessage: controller.errorMessagePassword,
              controller: controller.passwordCtr,
              label: AppStrings.password,
              bgcolor: Colors.transparent,
              keyboardType: TextInputType.visiblePassword,
              style:
                  TextStyle(color: myColors.black, fontFamily: AppFonts.almarai),
              labelStyle:
                  TextStyle(color: Colors.grey, fontFamily: AppFonts.almarai),
              border: true,
              onChange: (v) {
                controller.validatePassword();
              },
              radius: 10.rr(context),
              prefixIcon:
                  ImageViewer(url: AppAssets.iconKey).paddingAll(17.spr(context)),
              suffixIcon:  GestureDetector(
                onTap: () {
                  controller.togglePasswordVisibility();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageViewer(url: AppAssets.iconVisibility).paddingAll(16.spr(context)),
                    if (!controller.obscurePassword.value)
                      Transform.rotate(
                        angle: 30 * (3.14159265359 / 180),
                        child: Container(
                          height: 17.hr(context),
                          width: 1.wr(context),
                          color: myColors.grey,
                        ),
                      )
                  ],
                ),
              ),
              obsecureText: controller.obscurePassword.value,
            ).marginOnly(top: 10.hr(context)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotPassword);
                },
                child: CustomText(
                  text: AppStrings.forgotPassword,
                  fontColor: myColors.primary,
                  fontSize: 14.spr(context),
                ).marginOnly(top: 5.hr(context)),
              )
            ],
          ),
          SizedBox(height: 20.hr(context),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => GestureDetector(
                onTap: (){
                  controller.acceptSignInWithTouchAndFace.value=!controller.acceptSignInWithTouchAndFace.value;
                },
                child: CustomContainer(
                  margin: EdgeInsets.only(left: 2.spr(context)),
                  duration: Duration(milliseconds: 200),
                      width: 18.spr(context),
                      height: 18.spr(context),
                      decoration: BoxDecoration(
                        color: controller.acceptSignInWithTouchAndFace.value?myColors.primary:Colors.white,
                        borderRadius: BorderRadius.circular(5.rr(context)),
                        border: Border.all(color:controller.acceptSignInWithTouchAndFace.value?Colors.transparent: myColors.grey),
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        color: myColors.white,
                        size: 15.spr(context),
                      ),
                    ),
              )),


              CustomText(
                text: AppStrings.acceptSignInWith,
                fontSize: 13.spr(context),
              ).marginOnly(left: 12.wr(context)),
            ],
          ),
          CustomButton(
              buttonText: AppStrings.login,
              onTap: () {
                controller.performLogin();
              }).marginOnly(top: 20.hr(context)),
          Row(
            children: [
              Expanded(
                  child: Divider(
                color: myColors.grey,
              )),
              CustomText(
                text: AppStrings.orLoginWith,
                fontSize: 12.spr(context),
              ).marginSymmetric(horizontal: 13.wr(context)),
              Expanded(
                  child: Divider(
                color: myColors.grey,
              ))
            ],
          ).marginOnly(
              left: 29.wr(context), right: 29.wr(context), top: 24.hr(context)),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50.spr(context),
                width: 50.spr(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: myColors.grey.setOpacity(0.7))),
                child: Center(
                  child: ImageViewer(url: AppAssets.iconGoogle),
                ),
              ),
              Container(
                height: 50.spr(context),
                width: 50.spr(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: myColors.grey.setOpacity(0.7))),
                child: Center(
                  child: ImageViewer(url: AppAssets.iconApple),
                ),
              ),
            ],
          ))

          // Container(height: 20.hr(context),)
        ],
      ),
    );
  }
}
