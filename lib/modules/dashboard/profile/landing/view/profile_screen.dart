import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/enums/user_type.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_switch.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/core/widgets/shimmer/user_profile_shimmer.dart';
import 'package:amicus/core/widgets/theme_observer.dart';
import 'package:amicus/modules/dashboard/Landing/controller/dashhboard_controller.dart';
import 'package:amicus/modules/dashboard/profile/change_password/change_password.dart';
import 'package:amicus/modules/dashboard/profile/landing/controller/profile_controller.dart';
import 'package:amicus/modules/dashboard/profile/landing/view/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // ChatController controller = Get.find();
  // DashboardController dashboardController = Get.find();
  ThemeController themeController = Get.find();

  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ThemeObserver(
      () => Column(
        children: [
          appBarWidget(),
          Divider(
            color: myColors.grey.setOpacity(0.3),
          ),
          Obx(
            () => !controller.loadingProfile.value
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          userDetailsSection(),
                          SizedBox(
                            height: 27.h,
                          ),
                          settings(),
                          SizedBox(
                            height: 70.h,
                          )
                        ],
                      ),
                    ),
                  )
                : UserProfileShimmer(),
          ),
        ],
      ).marginOnly(bottom: 1.h),
    );
  }

  Widget appBarWidget() {
    return CustomContainer(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText(
            text: AppStrings.userProfile,
            fontSize: 18.sp,
            fontColor: myColors.blackWhiteAlternate,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.helveticaNeue,
          ).paddingOnly(bottom: 16.h)
        ],
      ),
    );
  }

  Widget userDetailsSection() {
    // DashboardController dashboardController = Get.find();
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ImageViewer(
              url: AppAssets.imgProfileBackground,
              height: 164.h,
              width: 166.w,
            ),
            Container(
              height: 72.sp,
              width: 72.sp,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: myColors.primary, width: 2.sp)),
            ),
            ImageViewer(
              url: AppAssets.imgUserProfile,
              fit: BoxFit.cover,
              height: 65.sp,
              width: 65.sp,
              borderRadius: 72.r,
            ),
          ],
        ),
        Column(
          children: [
            CustomText(
              text: "Kavin Becker",
              fontFamily: AppFonts.helveticaNeueBold,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: "kavinbecker1122@gmail.com",
              fontFamily: AppFonts.helveticaNeue,
              fontSize: 14.sp,
            ).paddingOnly(top: 8.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.editProfile);
              },
              child: CustomContainer(
                width: Get.width,
                decoration: BoxDecoration(
                    color: myColors.primary,
                    borderRadius: BorderRadius.circular(12.r)),
                margin: EdgeInsets.only(
                  top: 15.h,
                  left: 49.w,
                  right: 49.w,
                ),
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageViewer(
                      url: AppAssets.iconEdit,
                      color: myColors.black,
                      width: 16.sp,
                      height: 16.sp,
                    ).marginOnly(bottom: 2.h),
                    CustomText(
                      text: AppStrings.editProfile,
                      fontFamily: AppFonts.helveticaNeueBold,
                      fontSize: 12.sp,
                      fontColor: myColors.black,
                    ).marginOnly(left: 10.w)
                  ],
                ),
                // child: ,
              ),
            ),
          ],
        ).marginOnly(top: 10.h)
      ],
    );
  }

  Widget settings() {
    DashboardController dashboardController = Get.find();

    return customerSettings(dashboardController);
  }

  Widget customerSettings(DashboardController dashboardController) {
    return CustomContainer(
      margin: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 15.h),
      padding:
          EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: myColors.containerColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: myColors.grey.setOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          SettingTile(
            title: AppStrings.changePassword,
            iconPath: AppAssets.iconLock,
            iconColor: myColors.blueAccent,
            onPressed: () async {
              Get.toNamed(AppRoutes.changePasswordScreen);
            },
          ),
          SettingTile(
            title: AppStrings.getPaid,
            iconPath: AppAssets.iconCash,
            iconColor: myColors.error,
            onPressed: () async {
              // dashboardController.selectedBottomBarIndex.refresh();
            },
          ),
          SettingTile(
            title: AppStrings.darkMode,
            iconPath: AppAssets.iconMoon,
            iconColor: myColors.black,
            iconBackgroundColor: myColors.grey.setOpacity(0.2),
            trailing: CustomSwitch(
              isSwitchedAlready: themeController.myTheme == ThemeMode.dark,
              onSwitch: () {
                themeController.toggleTheme(true);
              },
            ),
            onPressed: () async {
              // await Get.toNamed(AppRoutes.myCars);
              // dashboardController.selectedBottomBarIndex.refresh();
            },
          ),
          SettingTile(
            title: AppStrings.pauseNotifications,
            iconPath: AppAssets.iconNotificationOff,
            iconColor: myColors.green,
            trailing: CustomSwitch(
              onSwitch: () {},
            ),
            onPressed: () async {
              // await Get.toNamed(AppRoutes.myCars);
              // dashboardController.selectedBottomBarIndex.refresh();
            },
          ),
          SettingTile(
            title: AppStrings.privacyPolicy,
            iconPath: AppAssets.iconPrivacy,
            iconColor: myColors.pink,
            onPressed: () async {
              Get.toNamed(AppRoutes.termsNConditions,
                  parameters: {"isPrivacy": "1"});

              // await Get.toNamed(AppRoutes.myCars);
              // dashboardController.selectedBottomBarIndex.refresh();
            },
          ),
          SettingTile(
            title: AppStrings.termsNConditions,
            iconPath: AppAssets.iconTerms,
            iconColor: myColors.secondary,
            onPressed: () async {
              Get.toNamed(AppRoutes.termsNConditions,
                  parameters: {"isPrivacy": "0"});

              // await Get.toNamed(AppRoutes.myCars);
              // dashboardController.selectedBottomBarIndex.refresh();
            },
          ),
          SettingTile(
            title: AppStrings.logout,
            iconPath: AppAssets.iconLogout,
            iconColor: myColors.primary,
            divider: false,
            onPressed: () async {
              // await Get.toNamed(AppRoutes.myCars);
              // dashboardController.selectedBottomBarIndex.refresh();
            },
          ),
        ],
      ),
    );
  }
}
