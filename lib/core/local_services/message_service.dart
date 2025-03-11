import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:ui';

class MessageService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  //
  static void showSnackBar({
    required String message,
    bool ?isSuccess,
    Duration? snackBarDuration,
  }) {
    Get.snackbar(
      "",
      message,
      titleText: const SizedBox(),
      // Hide default title
      messageText: Row(
        children: [
          Icon(
            isSuccess??false ? Icons.check_circle : Icons.error,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
              child:
                  Text(message, style: const TextStyle(color: Colors.white))),
        ],
      ),
      backgroundColor: isSuccess??false ? Colors.green : Colors.red,
      snackPosition: SnackPosition.TOP,
      // Show at top
      dismissDirection: DismissDirection.up,
      // Dismiss upwards
      borderRadius: 10,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      duration: snackBarDuration ?? const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
    );
  }
  //
  //
  //
  // static void showAlertDialog({
  //   String title = "Alert",
  //   String content = "Are you sure?",
  //   String confirmText = "OK",
  //   String cancelText = "Cancel",
  //   VoidCallback? onConfirm,
  //   VoidCallback? onCancel,
  //   bool barrierDismissible = true,
  //   Color? backgroundColor,
  // }) {
  //   Get.dialog(
  //     AlertDialog(
  //       title: Text(title),
  //       content: Text(content),
  //       backgroundColor: backgroundColor ?? Colors.white,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       actions: [
  //         if (onCancel != null)
  //           TextButton(
  //             onPressed: () {
  //               Get.back(); // Close dialog
  //               onCancel();
  //             },
  //             child: Text(cancelText),
  //           ),
  //         TextButton(
  //           onPressed: () {
  //             Get.back(); // Close dialog
  //             if (onConfirm != null) onConfirm();
  //           },
  //           child: Text(confirmText),
  //         ),
  //       ],
  //     ),
  //     barrierDismissible: barrierDismissible,
  //   );
  // }
  //
  static void showSuccessDialog({
    String? title,
    String? message,
    Widget? content,
    VoidCallback? onDone,
    bool barrierDismissible = true,
    Color? backgroundColor,
  }) async {
    await Future.delayed(Duration(milliseconds: 500), () {
      Get.dialog(

        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageViewer(url: AppAssets.imgSuccessDialog)
                  .marginOnly(bottom: 21.h, top: 31),
              if (title != null)

                CustomText(
                  text: title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ).marginOnly(bottom: 8.h),
              if (message != null)
                SizedBox(
                  width: Get.width * .85,
                  child: CustomText(
                    text: message,
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.normal,
                    maxLines: 5,
                  ),
                ),
              SizedBox(height: 27.h),
              if (content != null)
                content
              else
                SizedBox(
                  width: Get.width * 0.85,
                  child: CustomButton(
                    buttonText: AppStrings.done,
                    onTap: () {

                      if (onDone != null) onDone(); else Get.back();
                    },
                    borderRadius: 8.r,
                  ),
                ),
              SizedBox(height: 29.h)
            ],
          ),
          backgroundColor: backgroundColor ?? Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        transitionCurve: Curves.bounceOut,
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: barrierDismissible,
      );
    });}

  static void showSimpleDialog({
    String? title,
    String? message,
    Widget? content,
    VoidCallback? onDone,
    bool barrierDismissible = true,
    Color? backgroundColor,
  }) async {

      Get.dialog(

        Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5), // Adjust blur intensity
              child: Container(
                color: Colors.grey.setOpacity(0.2), // Slightly dim the background
              ),
            ),
            AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  if (title != null)

                    CustomText(
                      text: title,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontColor: myColors.blackWhiteAlternate,
                    ).marginOnly(bottom: 8.h),
                  if (message != null)
                    SizedBox(
                      width: Get.width * 0.65,
                      child: CustomText(
                        text: message,
                        fontSize: 12.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.normal,
                        fontColor: myColors.grey,
                        lineSpacing: 1.2,
                        maxLines: 5,
                      ),
                    ),
                  SizedBox(height: 27.h),
                  if (content != null)
                    content
                  else
                    SizedBox(
                      width: Get.width * 0.56,
                      child: CustomButton(
                        height: 40.h,
                        buttonText: AppStrings.done,
                        onTap: () {

                          if (onDone != null) onDone(); else Get.back();
                        },
                        borderRadius: 8.r,
                      ),
                    ),
                  SizedBox(height: 29.h)
                ],
              ),
              backgroundColor: backgroundColor ?? myColors.containerColor,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
        transitionCurve: Curves.bounceOut,
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: barrierDismissible,
      );
    }
  }
  //
  // static void showErrorDialog({
  //   required String title,
  //   required String message,
  //   bool barrierDismissible = true,
  //   Color? backgroundColor,
  // }) async {
  //
  //     Get.dialog(
  //       AlertDialog(
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Row(
  //               mainAxisSize: MainAxisSize.max,
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Gesture(
  //                   onPressed: (){
  //                     Get.back();
  //                   },
  //                   child: Container(
  //                     height: 30.sp,
  //                     width: 30.sp,
  //                     decoration:
  //                         BoxDecoration(color: AppColors.grey.setOpacity(0.2),shape: BoxShape.circle),
  //                     child: Center(child: Icon(Icons.close,color: AppColors.error,),),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             CustomText(
  //               text: title,
  //               fontSize: 18.sp,
  //               fontWeight: FontWeight.bold,
  //               fontColor: AppColors.error,
  //             ).marginOnly(bottom: 8.h),
  //             SizedBox(
  //               width: Get.width * .85,
  //               child: CustomText(
  //                 text: message,
  //                 fontSize: 12.sp,
  //                 textAlign: TextAlign.center,
  //                 fontWeight: FontWeight.normal,
  //                 maxLines: 5,
  //               ),
  //             ),
  //             HeightBox(height: 29.h)
  //           ],
  //         ),
  //         backgroundColor: backgroundColor ?? Colors.white,
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       ),
  //       transitionCurve: Curves.bounceOut,
  //       transitionDuration: const Duration(milliseconds: 500),
  //       barrierDismissible: barrierDismissible,
  //     );
  //
  // }
// }
//