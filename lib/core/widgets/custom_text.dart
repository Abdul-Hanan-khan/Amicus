
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? fontColor;
  final String? fontFamily;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final bool? lineThrough;
  final bool? underLined;
  final double? lineSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool ?animateColor;

  //  TextStyle? textStyle;

  // Constructor with optional parameters
  const CustomText(
      {super.key,
      required this.text,
      this.overflow,
      //    this.textStyle,
      this.fontSize = 16.0,
      this.fontColor,
      this.fontFamily,
      this.maxLines,
      this.fontWeight = FontWeight.normal,
      this.underLined,
      this.textAlign,
      this.lineThrough,
      this.lineSpacing,
      this.animateColor
      });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: animateColor == false  ? 50:500),
      style:  TextStyle(
        fontSize: fontSize,
        color: fontColor ?? myColors.textColor,
        fontFamily: fontFamily ?? AppFonts.helveticaNeue,
        fontWeight: fontWeight,
        decoration: (lineThrough == true)
            ? TextDecoration.lineThrough
            : (underLined == true)
            ? TextDecoration.underline
            : TextDecoration.none,
        height: lineSpacing ?? 1,
        decorationThickness: underLined == true ? 1.2 : null,
        decorationColor: fontColor ?? myColors.textColor,
      ),
      child: Text(
        text.tr,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 2,
        textAlign: textAlign,
      ),
    );
  }
}
