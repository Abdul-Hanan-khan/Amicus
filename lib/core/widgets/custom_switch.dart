import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CustomSwitch extends StatelessWidget {
  final VoidCallback onSwitch;
  bool ? isSwitchedAlready;
  CustomSwitch({super.key,required this.onSwitch,this.isSwitchedAlready});
  Rx<Alignment> alignment = Alignment.centerLeft.obs;

  @override
  Widget build(BuildContext context) {
    if(isSwitchedAlready??false){
      alignment.value = Alignment.centerRight;
    }
    return Obx(
      ()=> GestureDetector(
        onTap: (){
          alignment.value = alignment.value == Alignment.centerLeft?Alignment.centerRight:Alignment.centerLeft;
          onSwitch();
        },
        child: AnimatedContainer(
            alignment: alignment.value,
            height: 31.h,
            width: 51.w,
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: alignment.value == Alignment.centerLeft? myColors.grey : myColors.green,
              // themeController.selectedThemeData.value.colorScheme.secondary,
              borderRadius: BorderRadius.circular(24),
            ),
            duration: const Duration(milliseconds: 200),
            child: CircleAvatar(
              radius: 12.r,
              backgroundColor: myColors.white,
              // backgroundColor: themeController.themeMode.value != ThemeMode.light
              //     ? Colors.black
              //     : Colors.white,
            ).paddingSymmetric(vertical: 1.h),
          ),
      ),
    );

  }
}