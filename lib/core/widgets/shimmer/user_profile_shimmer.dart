import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          userDetailsShimmer(),
          SizedBox(height: 27.h),
          settingsShimmer(),
        ],
      ),
    );
  }

  Widget userDetailsShimmer() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(height: 164.h,),

            shimmerCircle(90.sp),
          ],
        ),
        SizedBox(height: 10.h),
        shimmerLine(width: 140.w, height: 20.h),
        SizedBox(height: 8.h),
        // shimmerLine(width: 180.w, height: 14.h),
        SizedBox(height: 15.h),
        shimmerButton(),
      ],
    );
  }

  Widget settingsShimmer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: myColors.grey.setOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: List.generate(4, (index) => shimmerSettingTile()),
      ),
    );
  }

  Widget shimmerSettingTile() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          shimmerCircle(40.sp),
          SizedBox(width: 15.w),
          shimmerLine(width: 200.w, height: 20.h),
        ],
      ),
    );
  }

  Widget shimmerCircle(double size) {
    return Shimmer.fromColors(
      baseColor: myColors.shimmerBaseColor,
      highlightColor: myColors.shimmerHighlightColor,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget shimmerLine({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: myColors.shimmerBaseColor,
      highlightColor: myColors.shimmerHighlightColor,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
      ),
    );
  }

  Widget shimmerButton() {
    return Shimmer.fromColors(
      baseColor: myColors.shimmerBaseColor,
      highlightColor: myColors.shimmerHighlightColor,
      child: Container(
        height: 40.h,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.grey,
        ),
      ),
    );
  }
}
