import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool? icon;
  final String? keyValue;
  final String? hintText;
  final String? initialValue;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final bool obsecureText;
  final bool border;
  Color? borderColor;
  final bool shadow;
  final bool devider;
  final TextInputType? keyboardType;
  final int maxLines;

  // final Color? color;
  final Color? bgcolor;
  final List<TextInputFormatter>? inputFormatters;
  final RxString errorMessage;
  final bool readonly;
  final bool? autoFocus;
  final Function()? ontap;
  final double? radius;
  final String? label;
  final RxBool? passwordVisibility;
  final double? spacingIfPrefixIsNull;
  double? paddingBottom;
  final EdgeInsetsGeometry? contentPadding;

  // final TextInputType? fieldInputType;
  final Color? iconColor;
  bool? enabled;
  TextStyle? style;
  TextStyle? hintStyle;

  CustomTextField(
      {Key? key,
      this.controller,
      this.prefixIcon,
      this.icon = true,
      this.keyValue = "1",
      this.hintText,
      this.initialValue,
      this.suffixIcon,
      this.validate,
      this.onChange,
      this.onFieldSubmitted,
      this.obsecureText = false,
      this.border = false,
      this.borderColor,
      this.shadow = false,
      this.devider = true,
      this.keyboardType,
      this.maxLines = 1,
      // this.color,
      this.inputFormatters,
      required this.errorMessage,
      this.readonly = false,
      this.ontap,
      this.radius,
      // this.fieldInputType,
      this.iconColor,
      this.enabled,
      this.passwordVisibility,
      this.bgcolor,
      this.label,
      this.spacingIfPrefixIsNull,
      this.contentPadding,
      this.paddingBottom,
      this.style,
      this.autoFocus,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    borderColor ??= const Color(0xff8D8D8D).setOpacity(0.2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if(label != null) CustomText(text: label!,fontFamily: AppFonts.almarai,fontSize: 16.sp,fontWeight: FontWeight.bold,).marginOnly(bottom: 10.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: bgcolor ?? myColors.grey.setOpacity(0.2),
            borderRadius: BorderRadius.circular(radius ?? 18.r),
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ]
                : [],
          ),
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            initialValue: initialValue,
            autofocus: autoFocus ?? false,
            enabled: enabled ?? true,
            style: style ??
                 TextStyle(
                  color: myColors.textColor,
                  fontSize: 15.0,
                ),
            onTap: ontap,
            readOnly: readonly,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            onChanged: onChange,
            inputFormatters: inputFormatters,
            cursorColor: myColors.grey,
            obscureText: obsecureText,
            maxLines: maxLines,
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                minHeight: 8.sp,
                minWidth: 8.sp,
              ),

              hintText: hintText,
              isCollapsed: true,
              labelText: label,
              labelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: AppFonts.almarai,

                  color: myColors.textColor),
              contentPadding: contentPadding ?? const EdgeInsets.all(15),
              fillColor: Colors.transparent,
              filled: true,
              prefix: prefixIcon != null
                  ? null
                  : SizedBox(
                      width: spacingIfPrefixIsNull ?? 20.w,
                    ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: hintStyle ??
                  TextStyle(
                    fontSize: 15.sp,
                    // color: myColors.textColor.setOpacity(0.7),
                  ),
              focusedErrorBorder: border == true
                  ? OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(radius ?? 18.r),
                    )
                  : InputBorder.none,
              focusedBorder: border == true
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: myColors.primary.setOpacity(.5),
                          width: 2),
                      borderRadius: BorderRadius.circular(radius ?? 18.r),
                    )
                  : InputBorder.none,
              enabledBorder: border == true
                  ? OutlineInputBorder(

                      borderSide: BorderSide(
                        color: shadow ? Colors.transparent : borderColor!,
                      ),
                      borderRadius: BorderRadius.circular(radius ?? 18.r),
                    )
                  : InputBorder.none,
              isDense: false,
            ),
          ),
        ),
        Obx(
          () => (errorMessage.value.isEmpty)
              ? SizedBox(
                  height: paddingBottom ?? 10,
                )
              : Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 5.h, bottom: 10.h),
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: errorMessage.value,
                    fontColor: myColors.error,
                    fontSize: 12.sp,
                  ),
                ),
        ),
      ],
    );
  }
}
