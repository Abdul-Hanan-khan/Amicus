import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/custom_text_field.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/core/widgets/picture_upload_widget.dart';
import 'package:amicus/modules/dashboard/report/controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SummaryStep extends StatelessWidget {
  Size size;
  BuildContext context;

  SummaryStep({super.key, required this.size, required this.context});

  ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                  color: myColors.green.setOpacity(0.17),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: CustomText(
                      text: AppStrings.yourBountySubmitted,
                      fontColor: myColors.green,
                      fontFamily: AppFonts.helveticaNeue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ImageViewer(url: AppAssets.iconCheck)
                ],
              ),
            ),
            pageTextField(
                    controller: controller.submittedToCtr,
                    hintText: "ocelork@gmail.com",
                    label: AppStrings.submissionSentTo)
                .marginOnly(top: 19.h),

            pageTextField(
                    controller: controller.municipalityCtr,
                    hintText: "Vancouver",
                    label: AppStrings.municipality)
                .marginOnly(top: 12.h),

            pageTextField(
                controller: controller.contactNumberCtr,
                hintText: "3-1-1 (within Vancouver), 604-873-7000 (outside)",
                label: AppStrings.contactNumber)
                .marginOnly(top: 12.h),

            pageTextField(
                controller: controller.municipalityCtr,
                hintText: "Vancouver",
                label: AppStrings.municipality)
                .marginOnly(top: 12.h),

            pageTextField(
                controller: controller.additionalInformationCtr,
                hintText: "ccclerk@vancouver.ca",
                label: AppStrings.additionalInformation)
                .marginOnly(top: 12.h),

            pageTextField(
                controller: controller.referenceIdCtr,
                hintText: "56335982",
                label: AppStrings.referenceId)
                .marginOnly(top: 12.h),


            Obx(
              () => CustomButton(
                onTap: () {
                  // controller.uploadImages();
                  Get.back();
                },
                buttonText: AppStrings.done,
                isProcessing: controller.uploadingImages.value,
              ),
            ).marginOnly(top: 35.h)
          ],
        ).marginSymmetric(horizontal: 21.w),
      ),
    );
  }

  Widget pageTextField({
    required TextEditingController controller,
    // required RxString errorMsg,
    required String hintText,
    required String label,
    int? maxLines,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        CustomTextField(
          controller: controller,
          errorMessage: RxString(""),
          bgcolor: myColors.grey.setOpacity(0.1),
          borderColor: myColors.grey.setOpacity(0.5),
          // border: true,
          radius: 8.r,
          hintText: hintText,
          enabled: true,
          label: null,

          spacingIfPrefixIsNull: 0,
          paddingBottom: 0,

          maxLines: maxLines ?? 1,
          inputFormatters: inputFormatters,
          hintStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.helveticaNeue,
              color: myColors.grey.setOpacity(0.6)),
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.helveticaNeue,
              color: myColors.grey),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
        ).marginOnly(top: 10.h),
      ],
    );
  }
}
