import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/core/widgets/theme_observer.dart';
import 'package:amicus/modules/dashboard/home/earnings/model/my_bounties_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/back_widget.dart';
import '../../../../../core/widgets/base_scaffold.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../controller/my_earnings_controller.dart';

class BountyDetails extends StatelessWidget {
  BountyDetails({super.key});

  BounteyItem item = BounteyItem();

  MyEarningsController controller = Get.find();
  String index = Get.parameters["index"] ?? "-1";

  @override
  Widget build(BuildContext context) {
    item = controller.bounties.data![int.parse(index)];
    print(item.referenceId);
    return ThemeObserver(
      () => BaseScaffold(
        top: true,
        bottom: true,
        body: Column(
          children: [
            appbar(context),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  _imagesSection(context),
                  _vehicleDetails(context),
                  _municipalityDetails(context),
                  CustomButton(onTap: (){Get.back();},buttonText: AppStrings.done,).marginOnly(top: 33.hr(context),left: 20.wr(context),right: 20.wr(context))
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
                text: AppStrings.details,
                fontSize: 20.sp,
                fontColor: myColors.blackWhiteAlternate,
                fontFamily: AppFonts.helveticaNeueBold,
              ),
              Container(
                height: 36.sp,
                width: 36.sp,
                padding: EdgeInsets.all(8.sp),
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

  Widget _imagesSection(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        item.images!.front != null
            ? Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: 77.wr(context),
                      height: 62.hr(context),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          item.images!.front!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.front,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.hr(context))
                  ],
                ))
            : Container(),
        SizedBox(
          width: 8.w,
        ),
        item.images!.back != null
            ? Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: 77.wr(context),
                      height: 62.hr(context),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          item.images!.back!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.back,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.hr(context))
                  ],
                ))
            : Container(),
        SizedBox(
          width: 8.w,
        ),
        item.images!.side != null
            ? Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: 77.wr(context),
                      height: 62.hr(context),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          item.images!.side!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.side,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.hr(context))
                  ],
                ))
            : Container(),
        SizedBox(
          width: 8.w,
        ),
        item.images!.context != null
            ? Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: 77.wr(context),
                      height: 62.hr(context),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          item.images!.context!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.context,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.hr(context))
                  ],
                ))
            : Container(),
      ],
    ).marginSymmetric(horizontal: 20.wr(context));
  }

  Widget _vehicleDetails(BuildContext context) {
    return CustomContainer(
      // height: 209.hr(context),
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
      child: Column(
        children: [
          _itemDetail(title: AppStrings.make, subtitle: item.make!,context: context),
          _itemDetail(title: AppStrings.model, subtitle: item.model!,context: context),
          _itemDetail(title: AppStrings.color, subtitle: item.color!,context: context),
          _itemDetail(
              title: AppStrings.licensePlate, subtitle: item.licensePlate!,context: context),
          _itemDetail(title: AppStrings.location, subtitle: item.location!,context: context),
          _itemDetail(title: AppStrings.timeStamp, subtitle: item.timestamp!,context: context),
        ],
      ),
    );
  }

  Widget _municipalityDetails(BuildContext context) {
    return CustomContainer(
      // height: 209.hr(context),
      width: double.infinity,
      margin: EdgeInsets.only(
          left: 20.wr(context), right: 20.wr(context), top: 10.hr(context)),
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
      child: Column(
        children: [
          _itemDetail(title: AppStrings.sentTo, subtitle: item.sentTo!,context: context),
          _itemDetail(
              title: AppStrings.enforcementOffice,
              subtitle: item.enforcementOffice!,context: context),
          _itemDetail(
              title: AppStrings.contactNumber, subtitle: item.contactNumber!,context: context),
          _itemDetail(
              title: AppStrings.additionalInformation,
              subtitle: item.additionalInformation!,context: context),
          _itemDetail(title: AppStrings.location, subtitle: item.location!,context: context),
        ],
      ),
    );
  }

  Widget _itemDetail({required String title, required String subtitle, required BuildContext context}) {
    return Row(
      children: [
        Expanded(
            child: CustomText(
          text: title,
          fontFamily: AppFonts.helveticaNeueBold,
        )),
        SizedBox(width:  20.w),
        Expanded(
            child: CustomText(
          text: subtitle,
          fontFamily: AppFonts.helveticaNeue,
          fontWeight: FontWeight.bold,
          fontColor: myColors.grey,
        ))
      ],
    ).marginOnly(top: 12.hr(context));
  }
}
