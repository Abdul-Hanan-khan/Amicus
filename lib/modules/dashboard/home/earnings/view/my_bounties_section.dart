import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/dashboard/home/earnings/controller/my_earnings_controller.dart';
import 'package:amicus/modules/dashboard/home/earnings/model/my_bounties_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyBountiesSection extends StatelessWidget {
  MyEarningsController controller;
  RxString selectedValue = "This Week".obs;

  MyBountiesSection(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        stats(context),
        bountiesList(context),
      ],
    );
  }

  Widget stats(BuildContext context) {
    return CustomContainer(
      height: 80.hr(context),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          vertical: 10.hr(context), horizontal: 20.wr(context)),
      padding: EdgeInsets.all(12.spr(context)),
      decoration: BoxDecoration(
        color: myColors.containerColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: myColors.black.setOpacity(0.2), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: myColors.grey.setOpacity(0.1),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                text: AppStrings.submitted,
                fontSize: 16.spr(context),
                fontWeight: FontWeight.bold,
                fontColor: myColors.blueAccent,
              ),
              CustomText(
                text: "15",
                fontSize: 24.spr(context),
                fontFamily: AppFonts.helveticaNeueBold,
                fontColor: myColors.blueAccent,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                text: AppStrings.reviewed,
                fontSize: 16.spr(context),
                fontWeight: FontWeight.bold,
                fontColor: myColors.green,
              ),
              CustomText(
                text: "08",
                fontSize: 24.spr(context),
                fontFamily: AppFonts.helveticaNeueBold,
                fontColor: myColors.green,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.wr(context)),
            decoration: BoxDecoration(
                color: myColors.primary,
                borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: AppStrings.submitted,
                  fontSize: 16.spr(context),
                  fontWeight: FontWeight.bold,
                  fontColor: myColors.white,
                ),
                CustomText(
                  text: "06",
                  fontSize: 24.spr(context),
                  fontFamily: AppFonts.helveticaNeueBold,
                  fontColor: myColors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bountiesList(BuildContext context) {
    return Obx(
      () => controller.fetchingBounties.value
          ? Center(
              child: CircularProgressIndicator(
                color: myColors.primary,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return bountyItem(
                    context: context, item: controller.bounties.data![index],index: index);
              },
              separatorBuilder: (context1, index) {
                return SizedBox(
                  height: 5.hr(context),
                );
              },
              itemCount: controller.bounties.data!.length),
    );
  }

  Widget bountyItem({required BuildContext context, required BounteyItem item, required int index}) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.bountyDetails,parameters: {'index': index.toString()});
      },
      child: CustomContainer(
        height: 80.hr(context),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.wr(context)),
        padding: EdgeInsets.all(12.spr(context)),
        decoration: BoxDecoration(
          color: myColors.containerColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: myColors.black.setOpacity(0.2), width: 0.5),
          boxShadow: [
            BoxShadow(
              color: myColors.grey.setOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 42.spr(context),
              width: 42.spr(context),
              padding: EdgeInsets.all(12.spr(context)),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: myColors.primary.setOpacity(0.1)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageViewer(url: AppAssets.iconEdgedContainer),
                  Icon(
                    Icons.check_rounded,
                    color: myColors.white,
                    weight: 20,
                    size: 15.spr(context),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: AppStrings.byLaw,
                  fontSize: 16.spr(context),
                  fontFamily: AppFonts.helveticaNeue,
                  fontColor: myColors.blackWhiteAlternate,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: AppStrings.referenceNumber,
                  fontSize: 10.spr(context),
                  fontFamily: AppFonts.helveticaNeue,
                  fontColor: myColors.grey,
                  fontWeight: FontWeight.bold,
                ).marginOnly(top: 4.hr(context))
              ],
            ).marginOnly(left: 11.wr(context)),

            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: item.enforcementOffice!,
                  fontSize: 16.spr(context),
                  fontFamily: AppFonts.helveticaNeue,
                  fontWeight: FontWeight.bold,
                  fontColor: myColors.blackWhiteAlternate,

                ),
                CustomText(
                  text: item.referenceId!,
                  fontSize: 10.spr(context),
                  fontFamily: AppFonts.helveticaNeue,
                  fontColor: myColors.grey,
                  fontWeight: FontWeight.bold,
                ).marginOnly(top: 4.hr(context))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
