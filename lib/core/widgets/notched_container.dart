import 'dart:ui';

import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/dashboard/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class NotchedContainer extends StatelessWidget {
  double width;
  double height;
  String text;
  RxDouble opacity;
  double fontSize;

  NotchedContainer(
      {required this.width, required this.height, required this.text,required this.opacity,required this.fontSize});



  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: opacity.value,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [

            // FrostedGlassContainer(height: 65.hr(context), width: width),
            // Container(height: height-20,width: width,color: Colors.white,),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: myColors.containerColor,
                  boxShadow: [
                    BoxShadow(
                        color: myColors.grey.setOpacity(0.1),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ]),
              child: Center(
                child: SizedBox(
                    width: width,
                    child: CustomText(
                      text: text,
                      maxLines: 2,
                      fontSize: fontSize,
                      textAlign: TextAlign.center,
                      fontFamily: AppFonts.helveticaNeueBold,
                    ).marginSymmetric(horizontal: 5.wr(context))),
              ),
            ),
            Positioned(
              top: -5,
              child: Transform.rotate(
                angle: 45 * (3.141592653589793 / 180),
                // Convert degrees to radians

                child: Container(
                  height: 20.spr(context),
                  width: 20.spr(context),
                  decoration: BoxDecoration(
                    color: myColors.containerColor,
                    borderRadius: BorderRadius.circular(5.rr(context)),
                  ),
                ),
              ),
            ),
            // , FrostedGlassContainer()
          ],
        ),
      ),
    );
  }
}

class FrostedGlassContainer extends StatelessWidget {
  double height;
  double width;

  FrostedGlassContainer({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15), // Rounded corners
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), // Frosted glass blur
        child: Container(
          width: 150.wr(context),
          height: 60.hr(context),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // Semi-transparent effect
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
          ),
        ),
      ),
    );
  }
}
