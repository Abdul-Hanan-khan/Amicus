
import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDottedButton extends StatelessWidget {
  Color? dottedBorderColor;
  Color? buttonColor;
  Widget? widget;
  String? buttonText;
  double? height;
  double? width;
  GlobalKey? buttonKey;
  void Function()? onTap;

  CustomDottedButton(
      {super.key,
        this.dottedBorderColor,
        this.buttonColor,
        this.widget,
        this.buttonText,
        this.height,
        this.width,
        this.buttonKey,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: dottedBorderColor ?? myColors.primary,
      strokeWidth: 2,
      dashPattern: [6, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      child: GestureDetector(
        key: buttonKey??key,
        onTap: onTap,
        child: Container(
          height: height?? 50.h,
          width: width?? double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 17.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: buttonColor?? myColors.primary.setOpacity(0.15),
          ),
          child:widget?? Center(
            child: CustomText(
              text: buttonText?? AppStrings.continueText,
              fontFamily: AppFonts.helvetica,
              fontSize: 16.sp,
              fontColor: myColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
