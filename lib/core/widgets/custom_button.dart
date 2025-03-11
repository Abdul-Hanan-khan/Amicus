
import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utills/app_fonts.dart';




class CustomButton extends StatelessWidget {
   Color? buttonColor;
  final Color? buttonTextColor;
  final String ?buttonText;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback onTap;
  final bool? showBorder;
  final bool? avoidDuplication;
  final Color? borderColor;
  final double? buttonTextSize;
  final Widget? leadingIcon;
  bool ?isProcessing;

   CustomButton(
      {super.key,
        this.buttonColor,
        this.buttonText,
        this.buttonTextColor,
        this.buttonTextSize,
        this.height,
        this.showBorder,
        this.borderColor,
        this.borderRadius,
        this.width,
        this.avoidDuplication,
        this.isProcessing,
       required this.onTap,
        this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    isProcessing??=false;
    buttonColor??=myColors.primary;
    return GestureDetector(
      // avoidDuplication: avoidDuplication,
      onTap: () =>
          onTap(),
      child: Container(
        height: height ?? 50.0.h, // Default height if not provided
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
                color: showBorder ?? false
                    ? borderColor ?? myColors.primary
                    : Colors.transparent),
            color: isProcessing!? myColors.grey.setOpacity(0.2):buttonColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: Center(
          child:isProcessing!? CircularProgressIndicator(color: myColors.primary,) :  CustomText(
            text: buttonText??AppStrings.continueText,
            fontColor: buttonTextColor ?? Colors.black,
            fontSize: buttonTextSize ?? 16.sp,
            fontFamily: AppFonts.almarai,
          ),
        ),
      ),
    );
  }
}