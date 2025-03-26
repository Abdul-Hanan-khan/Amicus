import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/back_widget.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/core/widgets/theme_observer.dart';
import 'package:amicus/modules/dashboard/home/earnings/view/my_bounties_section.dart';
import 'package:amicus/modules/dashboard/home/earnings/view/submission_chart.dart';
import 'package:amicus/modules/dashboard/home/earnings/controller/my_earnings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyEarnings extends StatelessWidget {
  MyEarnings({super.key});

  MyEarningsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ThemeObserver(
      () => BaseScaffold(
        top: true,
        bottom: true,
        body: Column(
          children: [
            appbar(context),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                earnedContainer(context),
                SubmissionGraph(),
                MyBountiesSection(controller)
              ],
            ),
          ))
          ],
        ),
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return CustomContainer(
      height: 56.hr(context),
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                text: AppStrings.appName,
                fontSize: 20.sp,
                fontColor: myColors.blackWhiteAlternate,
                fontFamily: AppFonts.helveticaNeueBold,
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.notifications);
                },
                child: Stack(
                  children: [
                    Container(
                        height: 36.sp,
                        width: 36.sp,
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                            color: myColors.primary.setOpacity(0.08),
                            shape: BoxShape.circle),
                        child: ImageViewer(url: AppAssets.iconNotification)),
                    Positioned(
                      right: 1,
                      child: Container(
                        width: 8.sp,
                        height: 8.sp,
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
          ),
        ],
      ),
    );
  }

  Widget earnedContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(
          height: 85.hr(context),
          width: Get.width,
          margin: EdgeInsets.only(top: 18.h, left: 20.w, right: 20.w),
          // padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: myColors.containerColor,
            borderRadius: BorderRadius.circular(10.r),
            border:
                Border.all(color: myColors.black.setOpacity(0.1), width: 0.5),
            boxShadow: [
              BoxShadow(
                color: myColors.grey.setOpacity(0.07),
                blurRadius: 3,
                spreadRadius: 3,
                // offset: Offset(0, -5),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: myColors.primary.setOpacity(0.1),
                  ),
                  child: ImageViewer(
                      height: 24.sp,
                      width: 24.sp,
                      url: AppAssets.iconStarDecorated),
                ).marginOnly(left: 20.w),
                CustomText(
                  text: "\$22.02",
                  fontSize: 42.sp,
                  fontColor: myColors.blackWhiteAlternate,
                  fontFamily: AppFonts.helveticaNeueBold,
                ).marginOnly(right: 15.w),
                CustomText(
                  text: AppStrings.earned,
                  fontColor: myColors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.helveticaNeue,
                ).marginOnly(right: 40.w),
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
}
