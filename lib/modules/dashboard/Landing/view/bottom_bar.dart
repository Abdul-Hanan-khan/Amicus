// ignore_for_file: deprecated_member_use

import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/dashboard/Landing/controller/dashhboard_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import 'package:get/get.dart';

import '../../../../core/utills/app_assets.dart';
import '../../../../core/widgets/custom_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DashboardController controller = Get.find();

    return Container(
      height: size.height * 0.08,
      width: size.width * 0.7,
      // margin: EdgeInsets.only(bottom: 5.h),
      child: CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.spr(context)),
        decoration: BoxDecoration(
          color: myColors.containerColor,
          borderRadius: BorderRadius.circular(10.rr(context)),
          boxShadow: [
            BoxShadow(
              color: myColors.grey.setOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 7,
              // offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bottomBarOption(
              context: context,
              index: 0,
              label: AppStrings.home,
              iconPath: AppAssets.iconHome,
              selectedColor: myColors.primary,
              onTap: () {
                if (controller.selectedBottomBarIndex.value != 0) {}
                controller.changeScreen(0);
              },
            ),
            bottomBarOption(
              context: context,
              index: 1,
              label: AppStrings.report,
              iconPath: AppAssets.iconAmicus,
              // selectedIconPath: AppAssets.iconPrimaryAmicus,
              onTap: () async {
                if (controller.selectedBottomBarIndex.value != 1) {
                  Get.toNamed(
                    AppRoutes.report,
                  );
                  await Future.delayed(Duration(seconds: 1));
                  controller.changeScreen(0);
                }
              },
            ),
            bottomBarOption(
              context: context,
              index: 2,
              label: AppStrings.profile,
              iconPath: AppAssets.imgProfile,
              onTap: () {
                if (controller.selectedBottomBarIndex.value != 2) {
                  // chatController.loadChats();
                }

                controller.changeScreen(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomBarOption({
  required BuildContext context,
  required String label,
  required String iconPath,
  required int index,
  required VoidCallback onTap,
  String? selectedIconPath,
  Color? selectedColor,
}) {
  DashboardController controller = Get.find();

  return Obx(() {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.spr(context)),
        padding: EdgeInsets.only(bottom: 5.hr(context)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (controller.selectedBottomBarIndex.value == index)
              Row(
                children: [
                  Container(
                    height: 2.spr(context),
                    width: 46.wr(context),
                    // margin: EdgeInsets.symmetric(horizontal: 5.w),
                    color: myColors.primary,
                    // width: 50,
                  ),
                ],
              )
            else
              SizedBox(
                height: 2.spr(context),
                width: 46.wr(context),
              ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index == 1)
                  Container(
                    height: 25.spr(context),
                    width: 25.spr(context),
                    padding: EdgeInsets.all(2.spr(context)),
                    decoration: BoxDecoration(
                      color: myColors.grey.setOpacity(1),
                      borderRadius: BorderRadius.circular(5.rr(context)),
                    ),
                    child: ImageViewer(
                      url: AppAssets.iconAmicus,
                      color: myColors.blackNWhite,
                    ).marginOnly(left: 2.wr(context)),
                  )
                else
                  ImageViewer(
                    url: iconPath,
                    height: 25.spr(context),
                    width: 25.spr(context),
                    color: controller.selectedBottomBarIndex.value == index
                        ? selectedColor
                        : index ==2?null: myColors.grey,
                  ),
                SizedBox(height: 4.hr(context)),
                CustomText(
                  text: label,
                  fontColor: controller.selectedBottomBarIndex.value == index
                      ? myColors.primary
                      : Colors.grey,
                  fontSize: 12.spr(context),
                  animateColor: false,
                ),
              ],
            ).paddingOnly(top: 5.hr(context)),
            Container()
          ],
        ),
      ),
    );
  });
}
