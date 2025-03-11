
import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingTile extends StatelessWidget {
  String iconPath;
  String title;
  Widget? trailing;
  Color? iconBackgroundColor;
  bool? divider;
  final VoidCallback onPressed;
  final Color iconColor;

  SettingTile(
      {super.key,
      required this.iconPath,
      required this.title,
      this.trailing,
        this.divider,
        this.iconBackgroundColor,
      required this.onPressed,
      required   this.iconColor
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed,
      child: Container(
        color: Colors.transparent,
        // height: 56.h,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 33.sp,
                        width: 33.sp,
                        decoration: BoxDecoration(
                          color: iconBackgroundColor?? iconColor.setOpacity(0.1),
                          shape: BoxShape.circle
                        ),
                        child: Center(
                          child: ImageViewer(url: iconPath,color: iconColor,height: 17.sp,width: 17.sp,),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                    child: Row(
                  children: [
                    CustomText(text: title,fontSize: 14.sp,),
                    Spacer(),
                    // if(subtitle != null)  CustomText(text: subtitle!,fontSize: 12.sp,fontColor: AppColors.grey,),
                    SizedBox(width: 10.w,),
                  trailing??  Icon(Icons.arrow_forward_ios_rounded,color: myColors.grey,size: 14.sp,),                ],
                ))
              ],
            ),
          if(divider != false)  Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container()),
                Expanded(
                  flex: 5,
                  child: Divider(
                    color: myColors.grey,
                    thickness: 0.4,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
