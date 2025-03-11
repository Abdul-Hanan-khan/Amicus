import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/back_widget.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/custom_text_field.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/dashboard/profile/change_password/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  ChangePasswordController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      top: true,
      bottom: true,
      body: Column(
        children: [
          appbar(context),
          _inputAndSubmission(context)
        ],
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return CustomContainer(
      height: 56.hr(context),
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20.wr(context)),
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackWidget(
                hasBorder: true,
              ),
              CustomText(
                text: AppStrings.changePassword,
                fontSize: 20.spr(context),
                fontColor: myColors.blackWhiteAlternate,
                fontFamily: AppFonts.helveticaNeueBold,
              ),
              Container(
                height: 36.spr(context),
                width: 36.spr(context),
                padding: EdgeInsets.all(8.spr(context)),
              ),
            ],
          ),
          Divider(
            color: myColors.grey.setOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _inputAndSubmission(BuildContext context){
    return   Column(
      children: [
        Obx(
              ()=> CustomTextField(
            errorMessage: controller.oldPwdError,
            controller: controller.oldPwdCtr,
            label: AppStrings.oldPassword,
            bgcolor: Colors.transparent,

            border: true,
            onChange: (v) {
              // controller.validatePassword();
            },
            radius: 10.rr(context),
            prefixIcon: ImageViewer(url: AppAssets.iconKey).paddingAll(12.spr(context)),
            suffixIcon:  GestureDetector(
              onTap: () {
                controller.toggleOldPwdVisibility();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageViewer(url: AppAssets.iconVisibility).paddingAll(14.spr(context)),
                  if (!controller.obscureOldPwd.value)
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
            obsecureText: controller.obscureOldPwd.value,
          ).marginOnly(top: 10.hr(context)),
        ),

        Obx(
              ()=> CustomTextField(
            errorMessage: controller.pwdError,
            controller: controller.pwdCtr,
            label: AppStrings.password,
            bgcolor: Colors.transparent,

            border: true,
            onChange: (v) {
              controller.validatePassword();
            },
            radius: 10.rr(context),
            prefixIcon: ImageViewer(url: AppAssets.iconKey).paddingAll(12.spr(context)),
            suffixIcon:  GestureDetector(
              onTap: () {
                controller.togglePwdVisibility();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageViewer(url: AppAssets.iconVisibility).paddingAll(14.spr(context)),
                  if (!controller.obscurePwd.value)
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
            obsecureText: controller.obscurePwd.value,
          ).marginOnly(top: 10.hr(context)),
        ),

        Obx(
              ()=> CustomTextField(
            errorMessage: controller.confirmPwdError,
            controller: controller.confirmPwdCtr,
            label: AppStrings.confirmPassword,
            bgcolor: Colors.transparent,

            border: true,
            onChange: (v) {
              controller.validateConfirmPassword();
            },
            radius: 10.rr(context),
            prefixIcon: ImageViewer(url: AppAssets.iconKey).paddingAll(12.spr(context)),
            suffixIcon:  GestureDetector(
              onTap: () {
                controller.toggleConfirmPwdVisibility();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageViewer(url: AppAssets.iconVisibility).paddingAll(14.spr(context)),
                  if (!controller.obscureConfirmPwd.value)
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
            obsecureText: controller.obscureConfirmPwd.value,
          ).marginOnly(top: 10.hr(context)),
        ),

        Obx(
    ()=> CustomButton(onTap: (){
            controller.changePassword();
          },
          buttonText: AppStrings.updatePassword,
            isProcessing: controller.processing.value,
          ),
        )
      ],
    ).marginSymmetric(horizontal: 20.wr(context));
  }
}
