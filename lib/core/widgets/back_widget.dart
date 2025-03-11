import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BackWidget extends StatelessWidget {
  String? iconUrl;
  VoidCallback? onPressed;
  bool ? hasBorder;

  BackWidget({super.key, this.iconUrl, this.onPressed,this.hasBorder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ??
          () {
            Get.back();
          },
      child: Container(
        height: 32.sp,
        width: 32.sp,
        padding: EdgeInsets.all(iconUrl == null ? 8.sp : 3.sp),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: hasBorder??false ? myColors.grey.setOpacity(0.5):Colors.transparent),
          color:  myColors.grey.setOpacity(0.02),
        ),
        // borderRadius: BorderRadius.circular(5.r)),
        child: ImageViewer(url: iconUrl ?? AppAssets.iconArrowBack,color: myColors.blackWhiteAlternate,),
      ),
    );
  }
}
