import 'dart:math';

import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/back_widget.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/stepper.dart';
import 'package:amicus/core/widgets/theme_observer.dart';
import 'package:amicus/modules/dashboard/report/controller/report_controller.dart';
import 'package:amicus/modules/dashboard/report/view/steps/image_upload_step.dart';
import 'package:amicus/modules/dashboard/report/view/steps/summary.dart';
import 'package:amicus/modules/dashboard/report/view/steps/vehicle_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportScreen extends StatelessWidget {
  ReportController controller = Get.find();
  ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ThemeObserver(
      () => BaseScaffold(
        top: true,
        bottom: true,
        body: Column(
          children: [
            appbar(size: size, context: context),
            stepper(size: size,context: context),
            Obx(() {
              if(controller.currentStep.value ==0){
                return ImageUploadStep(size: size, context: context);
              } else   if(controller.currentStep.value ==1){
                return VehicleDetailsStep(size: size, context: context);
              } else if (controller.currentStep.value == 2) {
                return SummaryStep(size: size, context: context);
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }

  Widget appbar({required Size size, required BuildContext context}) {
    return Column(
      children: [
        CustomContainer(
          height: size.height*0.07,
          width: double.infinity,
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackWidget(
                hasBorder: true,
              ),
              CustomText(
                text: AppStrings.appName,
                fontFamily: AppFonts.helveticaNeueBold,
                fontSize: 18.spr(context),
                fontColor: myColors.blackWhiteAlternate,
              ),
              Opacity(
                opacity: 0,
                child: BackWidget(),
              )
            ],
          ),
        ),
      ],
    );
  }


  Widget stepper({required Size size,required BuildContext context}) {
    return CustomContainer(
      // width: size.width*0.6,
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      height: size.height*0.1,
      color: Colors.transparent,
      child: Obx(()=> CustomStepper(steps: 3, currentStep: controller.currentStep.value)),
    );
  }
}
