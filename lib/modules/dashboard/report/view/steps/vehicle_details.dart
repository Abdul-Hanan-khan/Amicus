import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/custom_text_field.dart';
import 'package:amicus/core/widgets/dropdown_with_label.dart';
import 'package:amicus/core/widgets/picture_upload_widget.dart';
import 'package:amicus/modules/dashboard/report/controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VehicleDetailsStep extends StatelessWidget {
  Size size;
  BuildContext context;

  VehicleDetailsStep({super.key, required this.size, required this.context});

  ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _imagesSection(),
            Divider(
              color: myColors.grey.setOpacity(0.3),
            ),
            _carDetailsSection(),
            Obx(
              () => CustomButton(
                onTap: () {
                  controller.submitVehicleDetails();
                },
                buttonText: AppStrings.submit,
                isProcessing: controller.submittingVehicleDetails.value,
              ),
            ).marginOnly(top: 60.h)
          ],
        ).marginSymmetric(horizontal: 21.w),
      ),
    );
  }

  Widget _imagesSection() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        controller.frontImage.value.file != null
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
                        child: Image.file(
                          controller.frontImage.value.file!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.front,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.h)
                  ],
                ))
            : Container(),
        SizedBox(
          width: 8.w,
        ),
        controller.backImage.value.file != null
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
                        child: Image.file(
                          controller.backImage.value.file!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.back,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.h)
                  ],
                ))
            : Container(),
        SizedBox(
          width: 8.w,
        ),
        controller.sideImage.value.file != null
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
                        child: Image.file(
                          controller.sideImage.value.file!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.side,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.h)
                  ],
                ))
            : Container(),
        SizedBox(
          width: 8.w,
        ),
        controller.contextImage.value.file != null
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
                        child: Image.file(
                          controller.contextImage.value.file!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomText(
                      text: AppStrings.context,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(vertical: 19.h)
                  ],
                ))
            : Container(),
      ],
    );
  }

  Widget _carDetailsSection() {
    return Column(
      children: [
        DropdownWithLabel(
            items: controller.carMakesDDl, title: AppStrings.make),
        DropdownWithLabel(
                items: controller.carModelsDDl, title: AppStrings.model)
            .marginOnly(top: 12.h),
        DropdownWithLabel(
                items: controller.carColorsDDl, title: AppStrings.color)
            .marginOnly(top: 12.h),
        pageTextField(
                controller: controller.licenseCtr,
                errorMsg: controller.errorLicense,
                hintText: "LED-55652-66",
                label: AppStrings.licensePlate)
            .marginOnly(top: 12.h),
        pageTextField(
                controller: controller.locationCtr,
                errorMsg: controller.errorLocation,
                hintText: "Street #2",
                label: AppStrings.location)
            .marginOnly(top: 12.h),
        pageTextField(
                controller: controller.descriptionCtr,
                errorMsg: controller.errorDescription,
                hintText: AppStrings.explainHere,
                maxLines: 5,
                label: AppStrings.description)
            .marginOnly(top: 12.h),
      ],
    ).marginOnly(top: 19.hr(context));
  }

  Widget pageTextField(
      {required TextEditingController controller,
      required RxString errorMsg,
      required String hintText,
      required String label,
      int? maxLines,
      List<TextInputFormatter>? inputFormatters,
      TextInputType? inputType,
      Widget? suffix}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
        CustomTextField(
          controller: controller,
          errorMessage: errorMsg,
          bgcolor: Colors.transparent,
          borderColor: myColors.grey.setOpacity(0.5),
          border: true,
          radius: 8.r,
          hintText: hintText,
          // label: null,
          keyboardType: inputType ?? TextInputType.text,
          spacingIfPrefixIsNull: 0,
          paddingBottom: 0,
          suffixIcon: suffix,
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
