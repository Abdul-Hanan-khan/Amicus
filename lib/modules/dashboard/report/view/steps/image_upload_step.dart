import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/picture_upload_widget.dart';
import 'package:amicus/modules/dashboard/report/controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageUploadStep extends StatelessWidget {
  Size size;
  BuildContext context;

  ImageUploadStep({super.key, required this.size, required this.context});

  ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      PictureUploadWidget(
                        height: 160.spr(context),
                        output: controller.frontImage,
                      ),
                      CustomText(
                        text: AppStrings.front,
                        fontFamily: AppFonts.helveticaNeueBold,
                      ).marginSymmetric(vertical: 19.h)
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      PictureUploadWidget(
                        height: 160.spr(context),
                        output: controller.backImage,
                      ),
                      CustomText(
                        text: AppStrings.back,
                        fontFamily: AppFonts.helveticaNeueBold,
                      ).marginSymmetric(vertical: 19.h)
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      PictureUploadWidget(
                        height: 160.spr(context),
                        output: controller.sideImage,
                      ),
                      CustomText(
                        text: AppStrings.side,
                        fontFamily: AppFonts.helveticaNeueBold,
                      ).marginSymmetric(vertical: 19.h)
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      PictureUploadWidget(
                        height: 160.spr(context),
                        output: controller.contextImage,
                      ),
                      CustomText(
                        text: AppStrings.context,
                        fontFamily: AppFonts.helveticaNeueBold,
                      ).marginSymmetric(vertical: 19.h)
                    ],
                  ),
                ),
              ],
            ),
            Obx(
              () => CustomButton(
                onTap: () {
                  controller.uploadImages();
                },
                isProcessing: controller.uploadingImages.value,
              ),
            ).marginOnly(top: 60.h)
          ],
        ).marginSymmetric(horizontal: 21.w),
      ),
    );
  }
}
