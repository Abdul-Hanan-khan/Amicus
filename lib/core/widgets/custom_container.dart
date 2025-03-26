import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color ?color;
  final Decoration? decoration;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final Duration ?duration;
  final Curve curve;
  final bool ?animateColor;

  const CustomContainer({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.decoration,
    this.constraints,
    this.padding,
    this.margin,
    this.child,
    this.alignment,
    this.duration,
    this.curve = Curves.easeInOut,
    this.animateColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration?? Duration(milliseconds: animateColor == false  ? 50:500),
      // curve: curve,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: decoration ?? BoxDecoration(color: color??myColors.white),
      child: child,
    );
  }
}
