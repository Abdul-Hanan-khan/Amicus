
import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/back_widget.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/modules/dashboard/profile/terms/controller/terms_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsView extends StatelessWidget {
  final TermsController controller = Get.find();
  @override
  Widget build(BuildContext context) {

    return BaseScaffold(
      bottom: true,
      top: true,
      // statusBarIconBrightness: Brightness.light,
      body: Column(
        children: [
         appbar(context),
          Expanded(
            child: Container(
              width: Get.width,
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    termsSection(

                    ),
                  ],
                ).paddingSymmetric(horizontal: 24.w,),
              ),
            ),
          )

          // Expanded(
          //   child: SingleChildScrollView(child: carDetailsSection()),
          // ),
        ],
      ),
    );
  }




  Widget appbar(BuildContext context) {
    String isPrivacy = Get.parameters["isPrivacy"]??"0";
    return CustomContainer(
      height: 56.hr(context),
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackWidget(
                hasBorder: true,
              ),
              CustomText(
                text: isPrivacy == "1"?AppStrings.privacyPolicy: AppStrings.termsNConditions,
                fontSize: 20.sp,
                fontColor: myColors.blackWhiteAlternate,
                fontFamily: AppFonts.helveticaNeueBold,
              ),
              Container(
                height: 36.sp,
                width: 36.sp,
                padding: EdgeInsets.all(8.sp),
              ),
            ],
          ),
          Divider(
            color: myColors.grey.setOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget termsSection(){
    return Obx(() {
      if (controller.termsList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: controller.termsList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final section = controller.termsList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text:  section.title,
                fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: AppFonts.helveticaNeueBold,
              ),
              SizedBox(height: 8),
              ...section.content.map((text) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14.sp, color: myColors.textColor),
                    children: formatText(text),
                  ),
                ),
              )),
              if (section.bulletPoints.isNotEmpty)
                Column(
                  children: section.bulletPoints
                      .map((point) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("• ", style: TextStyle(fontSize: 16,color: myColors.textColor)),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 14, color: myColors.textColor),
                            children: formatText(point),
                          ),
                        ),
                      ),
                    ],
                  ))
                      .toList(),
                ),
              SizedBox(height: 20),
            ],
          );
        },
      );
    });
  }

  List<TextSpan> formatText(String text) {
    List<TextSpan> spans = [];
    final regex = RegExp(r'\*\*(.*?)\*\*'); // Detects **bold text**

    text.splitMapJoin(
      regex,
      onMatch: (match) {
        spans.add(TextSpan(
            text: match.group(1),
            style: TextStyle(fontWeight: FontWeight.bold)));
        return "";
      },
      onNonMatch: (nonMatch) {
        spans.add(TextSpan(text: nonMatch));
        return "";
      },
    );
    return spans;
  }
}
