import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/back_widget.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/core/widgets/shimmer/notification_shimmer.dart';
import 'package:amicus/core/widgets/theme_observer.dart';
import 'package:amicus/modules/notification/controller/Notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notification extends StatelessWidget {
  Notification({super.key});

  NotificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      top: true,
      bottom: true,
      body: Column(
        children: [
          appbar(context),
          Expanded(child: _notifications(context))
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
                text: AppStrings.notifications,
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
  Widget _notifications(BuildContext context){
    return Obx(() {
      if (controller.processing.value) {
        return NotificationShimmer();
      }
      return ListView(
        padding: EdgeInsets.all(12),
        children: controller.groupedNotifications.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (entry.key != "Today")
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomContainer(

                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: myColors.containerColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText(
                        text:  entry.key,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.spr(context),
                        fontColor: myColors.grey.setOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ...entry.value.map((notification) {
                return  CustomContainer(
                  margin: EdgeInsets.only(top: 4.hr(context)),
                  padding: EdgeInsets.symmetric(horizontal: 20.wr(context),vertical: 17.hr(context)),
                  decoration: BoxDecoration(
                    color: myColors.containerColor,
                    borderRadius: BorderRadius.circular(10.rr(context)),
                    border:
                    Border.all(color: myColors.black.setOpacity(0.2), width: 0.5),
                    boxShadow: [
                      BoxShadow(
                        color: myColors.grey.setOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 1,
                        // offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(child: CustomText(text:  notification.message,maxLines: 5,)),
                      ImageViewer(url:notification.status == "success"? AppAssets.iconSuccess:AppAssets.iconSuccessDanger)
                    ],
                  ),
                );
              }).toList(),
            ],
          );
        }).toList(),
      );
    });
  }
}

