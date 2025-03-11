import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/modules/dashboard/report/controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomStepper extends StatelessWidget {
  final int steps;
  final int currentStep;


   CustomStepper({super.key, required this.steps, required this.currentStep});

   ReportController reportController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: List.generate(steps * 2 - 1, (index) {
          if (index % 2 == 0) {
            int stepIndex = index ~/ 2;
            bool isActive = stepIndex == currentStep;
            bool isCompleted = stepIndex < currentStep;

            return GestureDetector(
              onTap: (){
                print("tappe detected");
                isActive;
                if(isCompleted){

                  stepIndex;
                  reportController.currentStep.value = stepIndex;
                }
              },
              child: CustomContainer(
                width: 40.sp,
                height: 40.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? const Color(0xffCE9D02)
                      : (isCompleted ? myColors.primary : myColors.stepperGrey),
                  border: isActive
                      ? Border.all(color: myColors.primary, width: 4)
                      : null,
                ),
                alignment: Alignment.center,
                child: CustomText(
                 text: "${stepIndex + 1}",
                    fontFamily: AppFonts.helveticaNeueBold,
                    fontSize: 22.sp,
                    fontColor: isActive ? Colors.white : Colors.transparent,


                ),
              ),
            );
          } else {
            bool isCompleted = (index ~/ 2) < currentStep;

            return Expanded(
              child: CustomContainer(
                height: 5,
                color: isCompleted ? myColors.primary : myColors.stepperGrey,
              ),
            );
          }
        }),
      ),
    );
  }
}
