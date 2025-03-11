
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileShimmer extends StatelessWidget {
  EditProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            avatarSection(),
            personalInformationSection(),
          ],
        )
      ],
    );
  }

  /// Avatar & Basic Info Section
  Widget avatarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _shimmerCircle(size: 100.sp), // Profile Picture Placeholder
          ],
        ),

        _shimmerBox(height: 24.h, width: 180.w, borderRadius: 5.r).marginOnly(top: 10.h),
        _shimmerBox(height: 24.h, width: 200.w, borderRadius: 5.r).marginOnly(top: 10.h),


      ],
    ).paddingOnly(top: 18.h, left: 21.w, right: 21.w);
  }

  /// Personal Information Section
  Widget personalInformationSection() {
    return Column(
      children: [

        editField(),
        editField(),
        editField(),
        editField(),
        editField(),
        editField(),

      ],
    ).paddingOnly(top: 15.h, left: 21.w, right: 21.w);
  }

  /// Shimmer Loading Box
  Widget _shimmerBox({required double height, double? width, double borderRadius = 0}) {
    return Shimmer.fromColors(
      baseColor: myColors.shimmerBaseColor,
      highlightColor: myColors.shimmerHighlightColor,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.grey, // Ensures visibility
        ),
      ),
    );
  }

  /// Shimmer Loading Circle
  Widget _shimmerCircle({required double size}) {
    return Shimmer.fromColors(
      baseColor: myColors.shimmerBaseColor,
      highlightColor: myColors.shimmerHighlightColor,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey, // Ensures visibility
        ),
      ),
    );
  }

  /// Editable Field Shimmer Placeholder
  Widget editField() {
    return _shimmerBox(height: 46.h, borderRadius: 10.r).marginOnly(top: 24.h);
  }
}
