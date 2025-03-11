

import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      MyColors(
        backgroundColor: Colors.white.setOpacity(0.98),
        blackWhiteAlternate: Colors.black,
        primaryNGrey: Color(0xffFCC000),
        primary: Color(0xffFCC000),
        secondary: Color(0xffEC7826),
        containerColor: Colors.white,
        textColor: Colors.black,
        blueAccent: Color(0xff4A86F7),
        blackNWhite: Color(0xffffffff),
        stepperGrey: Color(0xffF5F5F5),
        error: Color(0xffFC1418),
        green: Color(0xff67CE67),
        pink: Color(0xffFF006B),
        black: Colors.black,
        shimmerBaseColor: Colors.grey[300]!,
        shimmerHighlightColor: Colors.grey[100]!,
        // shimmerBaseColor: Colors.black,
        white: Colors.white,
        grey:  Colors.grey,
        red: Colors.red,
      ),
    ],
  );

  static final darkTheme = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      MyColors(
        backgroundColor: Colors.black,
        blackWhiteAlternate: Colors.white,
        primaryNGrey: Colors.grey,
        primary: Color(0xffFCC000),
        secondary: Color(0xffEC7826),
        containerColor: Color(0xff1C1C1C),
        textColor: Color(0xff7F7F7F),
        blueAccent: Color(0xff4A86F7),
        blackNWhite: Color(0xff000000),
        stepperGrey: Color(0xff1C1C1C),
        green: Color(0xff67CE67),
        pink: Color(0xffFF006B),
        error: Color(0xffFC1418),
        shimmerBaseColor: Colors.grey[800]!,
        shimmerHighlightColor: Colors.grey[600]!,
        black: Colors.black,
        white: Colors.white,
        grey:  Colors.grey,
        red: Colors.red,
      ),
    ],
  );
}

class MyColors extends ThemeExtension<MyColors> {
  final Color backgroundColor;
  final Color blackWhiteAlternate;
  final Color primary;
  final Color primaryNGrey;
  final Color secondary;
  final Color containerColor;
  final Color textColor;
  final Color blueAccent;
  final Color blackNWhite;
  final Color stepperGrey;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Color green;
  final Color pink;
  final Color error;
  final Color black;
  final Color white;
  final Color grey;
  final Color red;

  MyColors({
    required this.backgroundColor,
    required this.blackWhiteAlternate,
    required this.primary,
    required this.primaryNGrey,
    required this.secondary,
    required this.containerColor,
    required this.textColor,
    required this.blueAccent,
    required this.blackNWhite,
    required this.stepperGrey,
    required this.green,
    required this.pink,
    required this.error,
    required this.black,
    required this.white,
    required this.grey,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.red,
  });

  static MyColors fallback() {
    return MyColors(
      backgroundColor: Colors.white.setOpacity(0.98),
      blackWhiteAlternate: Colors.black,
      primary: Colors.orange,
      primaryNGrey: Colors.orange,
      secondary: Color(0xffEC7826),
      containerColor: Color(0xff1C1C1C),
      textColor: Color(0xff7F7F7F),
      blueAccent: Color(0xff4A86F7),
      blackNWhite: Color(0xffffffff),
      stepperGrey: Color(0xffF5F5F5),
      green: Color(0xff67CE67),
      pink: Color(0xffFF006B),
      error: Color(0xffFC1418),
      shimmerBaseColor: Colors.grey[800]!,
      shimmerHighlightColor: Colors.grey[100]!,
      black: Colors.black,
      white: Colors.white,
      grey: Colors.grey,
      red: Colors.red,
    );
  }

  @override
  MyColors copyWith(
      {Color? blackWhiteAlternate,
      Color? backgroundColor,
      Color? primary,
      Color? primaryNGrey,
      Color? secondary,
      Color? containerColor,
      Color? textColor,
      Color? blueAccent,
      Color? blackNWhite,
      Color? stepperGrey,
      Color? green,
      Color? pink,
      Color? error,
      Color? black,
      Color? shimmerBaseColor,
      Color? shimmerHighlightColor,
      Color? white,
      Color? red,
      Color? grey}) {
    return MyColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      blackWhiteAlternate: blackWhiteAlternate ?? this.blackWhiteAlternate,
      primary: primary ?? this.primary,
      primaryNGrey: primaryNGrey ?? this.primaryNGrey,
      secondary: secondary ?? this.secondary,
      containerColor: containerColor ?? this.containerColor,
      textColor: textColor ?? this.textColor,
      blueAccent: blueAccent ?? this.blueAccent,
      blackNWhite: blackNWhite ?? this.blackNWhite,
      stepperGrey: stepperGrey ?? this.stepperGrey,
      green: green ?? this.green,
      pink: pink ?? this.pink,
      error: error?? this.error,
      black: black ?? this.black,
      shimmerHighlightColor:shimmerHighlightColor ?? this.shimmerHighlightColor,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      white: white ?? this.white,
      grey: grey ?? this.grey,
      red: red?? this.red
    );
  }

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      blackWhiteAlternate: Color.lerp(blackWhiteAlternate, other.blackWhiteAlternate, t)!,
      primaryNGrey: Color.lerp(primaryNGrey, other.primaryNGrey, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      containerColor: Color.lerp(containerColor, other.containerColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      blueAccent: Color.lerp(blueAccent, other.blueAccent, t)!,
      blackNWhite: Color.lerp(blackNWhite, other.blackNWhite, t)!,
      stepperGrey: Color.lerp(stepperGrey, other.stepperGrey, t)!,
      green: Color.lerp(green, other.green, t)!,
      pink: Color.lerp(pink, other.pink, t)!,
      error: Color.lerp(error, other.error, t)!,
      black: Color.lerp(black, other.black, t)!,
      shimmerBaseColor: Color.lerp(shimmerBaseColor, other.shimmerBaseColor, t)!,
      shimmerHighlightColor: Color.lerp(shimmerHighlightColor, other.shimmerHighlightColor, t)!,
      white: Color.lerp(white, other.white, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      red: Color.lerp(red, other.red, t)!,
    );
  }
}

MyColors get myColors =>
    Get.context!.theme.extension<MyColors>() ?? MyColors.fallback();
