import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/core/widgets/notched_container.dart';
import 'package:amicus/core/widgets/progress_indicator.dart';
import 'package:amicus/core/widgets/theme_observer.dart';
import 'package:amicus/modules/dashboard/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ThemeController themeController = Get.find();
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print("home build");
    return ThemeObserver(
      () => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          appbar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  earnedContainer(context),
                  badgesContainer(context),
                  statsContainer(context),
                ],
              ),
            ),
          )
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
              CustomText(
                text: AppStrings.welcome,
                fontSize: 20.spr(context),
                fontColor: myColors.blackWhiteAlternate,
                fontFamily: AppFonts.helveticaNeueBold,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.notifications);
                },
                child: Stack(
                  children: [
                    Container(
                        height: 36.spr(context),
                        width: 36.spr(context),
                        padding: EdgeInsets.all(8.spr(context)),
                        decoration: BoxDecoration(
                            color: myColors.primary.setOpacity(0.08),
                            shape: BoxShape.circle),
                        child: ImageViewer(url: AppAssets.iconNotification)),
                    Positioned(
                      right: 1.wr(context),
                      child: Container(
                        width: 8.spr(context),
                        height: 8.spr(context),
                        decoration: BoxDecoration(
                            color: myColors.primary, shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: myColors.grey.setOpacity(0.3),
            height: 1.hr(context),
          ),
        ],
      ),
    );
  }

  Widget earnedContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.myEarnings);
          },
          child: CustomContainer(
            height: 120.hr(context),
            width: Get.width,
            margin: EdgeInsets.only(
                top: 18.hr(context),
                left: 20.wr(context),
                right: 20.wr(context)),
            // padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: myColors.containerColor,
              borderRadius: BorderRadius.circular(10.rr(context)),
              border:
                  Border.all(color: myColors.black.setOpacity(0.2), width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: myColors.grey.setOpacity(0.1),
                  blurRadius: 3,
                  spreadRadius: 3,
                  // offset: Offset(0, -5),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.spr(context)),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: myColors.primary.setOpacity(0.1),
                        ),
                        child: ImageViewer(
                            height: 28.spr(context),
                            width: 28.spr(context),
                            url: AppAssets.iconCoinDollar),
                      ).marginOnly(left: 20.wr(context)),
                      CustomText(
                        text: "\$22.02",
                        fontSize: 44.spr(context),
                        fontColor: myColors.blackWhiteAlternate,
                        fontFamily: AppFonts.helveticaNeueBold,
                      ).marginOnly(right: 2.wr(context)),
                      CustomText(
                        text: AppStrings.earned,
                        fontColor: myColors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.helveticaNeue,
                      ).marginOnly(right: 40.wr(context)),
                    ],
                  ),
                ),
                Positioned(
                  left: -5.spr(context),
                  bottom: -5.spr(context),
                  child: SizedBox(
                    // color: Colors.pink,
                    width: 40.spr(context),
                    height: 40.spr(context),
                    child: Image.asset(
                      AppAssets.imgEarnedContainerLeft,
                      color: myColors.primaryNGrey,
                    ),
                  ),
                ),
                Positioned(
                  right: -5.wr(context),
                  child: SizedBox(
                    // color: Colors.pink,
                    width: 90.wr(context),
                    height: Get.height,
                    child: Image.asset(
                      AppAssets.imgEarnedContainerRight,
                      color: myColors.primaryNGrey,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        // ImageViewer(
        // width: Get.width,
        //     url: AppAssets.earnedRectangle),
      ],
    );
  }

  Widget badgesContainer(BuildContext context) {
    return CustomContainer(
      // height: 291.h,
      width: Get.width,
      margin: EdgeInsets.only(
          top: 18.hr(context), left: 20.wr(context), right: 20.wr(context)),
      padding: EdgeInsets.symmetric(horizontal: 24.wr(context)),
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: myColors.containerColor,
        borderRadius: BorderRadius.circular(10.rr(context)),
        border: Border.all(color: myColors.black.setOpacity(0.2), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: myColors.grey.setOpacity(0.1),
            blurRadius: 3,
            spreadRadius: 3,
            // offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width,
          ),
          GestureDetector(
            onTap: () {
              controller.toggleTargetViewLarge();
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.toggleTargetViewLarge();
                  },
                  child: ImageViewer(
                      height: 120.hr(context),
                      width: 118.wr(context),
                      url: AppAssets.rankContainers),
                ),
                CustomText(
                  text: "1",
                  fontSize: 64.spr(context),
                  fontFamily: AppFonts.helveticaNeueBold,
                  fontColor: Color(0xff3B0A96),
                ).marginOnly(top: 10.hr(context)),
                Positioned(
                  bottom: -20.hr(context),
                  child: CustomText(
                    text: AppStrings.yourGoalPercentage,
                    fontColor: myColors.grey,
                    fontFamily: AppFonts.helveticaNeue,
                  ),
                ),
                Positioned(
                    bottom: -25.hr(context),
                    child: NotchedContainer(
                      height: 50.hr(context),
                      width: 150.wr(context),
                      fontSize: 12.spr(context),
                      opacity: controller.targetOpacityLarge,
                      text: AppStrings.submissionsRequired,
                    ))
              ],
            ).marginOnly(top: 35.hr(context)),
          ),

          SizedBox(
            height: 20.hr(context),
          ),

          Container(
            width: Get.width,
            height: 52.hr(context),
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerRight,
                children: [


                  HorizontalProgressBar(
                    progress: 0.4,
                    progressColor: myColors.primary,
                    indicatorWidget: ImageViewer(
                        height: 25.spr(context),
                        width: 25.spr(context),
                        url: AppAssets.iconStarGoal),
                  ),

                  Positioned(
                    bottom: -35.hr(context),
                    left: 0.wr(context),
                    right: 0.wr(context),
                    child: Container(
                      width:  Get.width,

                      child: Row(
                        children: [
                          CustomText(
                            text: AppStrings.badgesEarned,
                            fontColor: myColors.grey,
                            fontFamily: AppFonts.helveticaNeue,
                          ),
                          Spacer(),
                          ImageViewer(
                              height: 14.hr(context),
                              width: 14.5.wr(context),
                              url: AppAssets.iconBadge),
                          CustomText(
                            text: "0",
                            fontSize: 18.spr(context),
                            fontFamily: AppFonts.helveticaNeueBold,
                          ).marginOnly(left: 7.wr(context)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -7.wr(context),
                    child: GestureDetector(
                      onTap: (){
                        controller.toggleTargetViewSmall();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.loose,
                        clipBehavior: Clip.none,
                        children: [

                          ImageViewer(
                              height: 32.hr(context),
                              width: 26.wr(context),
                              url: AppAssets.rankContainers),
                          CustomText(
                            text: "2",
                            fontSize: 16.spr(context),
                            fontFamily: AppFonts.helveticaNeueBold,
                            fontColor: Color(0xff3B0A96),
                          ).marginOnly(top: 5.hr(context)),
                          Positioned(
                            bottom: -45.hr(context),
                            child: NotchedContainer(
                                fontSize: 9.spr(context),
                                width: 120.wr(context),
                                height: 48.hr(context),
                                text: AppStrings.submissionsRequired,
                                opacity: controller.targetOpacitySmall),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 27.hr(context),),

          // ImageViewer(url: AppAssets.crown),
        ],
      ),
    );
  }

  Widget statsContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        itemStats(
            iconPath: AppAssets.iconSubmitted,
            title: "75",
            subtitle: AppStrings.submitted,
            context: context),
        itemStats(
            iconPath: AppAssets.iconReviewed,
            title: "23",
            subtitle: AppStrings.reviewed,
            context: context),
        itemStats(
            iconPath: AppAssets.iconBadgeOutlined,
            title: "54",
            subtitle: AppStrings.rewarded,
            context: context),
      ],
    ).marginOnly(
        top: 18.hr(context), left: 20.wr(context), right: 20.wr(context));
  }

  Widget itemStats({
    required String iconPath,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return CustomContainer(
      // width: 105.w,
      padding: EdgeInsets.symmetric(horizontal: 20.wr(context)),
      height: 140.hr(context),
      decoration: BoxDecoration(
        color: myColors.containerColor,
        borderRadius: BorderRadius.circular(10.rr(context)),
        border: Border.all(
            color: myColors.black.setOpacity(0.2), width: 0.5.wr(context)),
        boxShadow: [
          BoxShadow(
            color: myColors.grey.setOpacity(0.09),
            blurRadius: 3,
            spreadRadius: 2,
            // offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 52.spr(context),
            width: 52.spr(context),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: myColors.primary.setOpacity(0.1)),
            child: Center(
              child: ImageViewer(url: iconPath),
            ),
          ),
          CustomText(
            text: title,
            fontSize: 26.spr(context),
            fontFamily: AppFonts.helveticaNeueBold,
          ),
          CustomText(
            text: subtitle,
            fontSize: 14.spr(context),
            fontFamily: AppFonts.helveticaNeue,
            fontWeight: FontWeight.bold,
            fontColor: myColors.grey,
          ),
        ],
      ),
    );
  }
}
